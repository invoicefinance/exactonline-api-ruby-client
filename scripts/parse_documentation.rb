require 'faraday'
require 'nokogiri'
require 'byebug'

class ExactDocumentationParser

  attr_accessor :index_resources, :resources

  def initialize
    @conn = Faraday.new(url: "https://start.exactonline.nl")
  end

  def run
    @resources = index_resources.map do |index_resource|
      full_resource = full_resource(index_resource)
      [full_resource[:name], full_resource]
    end.to_h

    self
  end

  private

  def index_resources
    @index_resources ||= (
      puts "Requesting documentation index..."

      doc = Nokogiri::HTML(
        @conn.get("/docs/HlpRestAPIResources.aspx").body
      )

      doc.css("#referencetable tr:not(.header)").to_a.sample(10).map do |tr|
        tds = tr.css("td")
        endpoint_a = tds[1].css("a")

        # Don't handle BETA endpoints
        next if endpoint_a.text =~ /\(BETA\)/

        {
          service: tds[0].text,
          name: endpoint_a.text,
          documentation_href: endpoint_a.attribute("href").value,
          methods: tds[3].text.split(",").map(&:strip),
          has_webhook: tds[4].attribute("class").include?("HasWebhook")
        }
      end
    )
  end

  def full_resource(index_resource)
    documentation_path = "/docs/#{index_resource[:documentation_href]}"
    puts "Doing request for #{documentation_path}"

    doc = Nokogiri::HTML(
      @conn.get(documentation_path).body
    )

    # TODO: Mandatory parameters (out of uri boldness)

    # This code is translation directly from the showMethod function
    ignored_classes_by_method = {
      get: ["showpost", "showput", "showdelete"],
      post: ["showget", "showput", "showdelete"],
      put: ["showget", "showpost", "showdelete", "hidekey", "hideput"],
      delete: ["showget", "showpost", "showput", "showdelete", "hideput"]
    }

    fields = doc.css("table#referencetable tr:not(.header)").map do |tr|
      # This code is translated directly from the top of the `$(document).ready` function
      classes = tr.attributes["class"].value
      classes += " key" if tr.css("[data-key='True']").any?
      classes += " hidedelete" if tr.css("[data-key='False']").any?
      classes += " hidekey" if tr.css(".navigation").any?

      # Get the info for this attribute
      field_methods = ignored_classes_by_method.reject do |_, ignored_classes|
        ignored_classes.any?{|klass| classes.include?(klass)}
      end.keys

      is_primary_key = classes.include?(" key")
      is_mandatory = tr.css("img[title='Mandatory']").any?
      is_webhookable = tr.css("td.webhook-content img").any?

      _, field_name, _, _, field_type, *_, field_description = tr.css("td").map(&:content).map(&:strip)

      {
        name: field_name,
        type: field_type,
        description: field_description,
        methods: field_methods,
        is_primary_key: is_primary_key,
        is_mandatory: is_mandatory,
        is_webhookable: is_webhookable
      }
    end

    full_endpoint_uri = doc.css("p#serviceUri").text

    {
      name: doc.css("p#endpoint").text,
      uri: full_endpoint_uri,
      methods: doc.css("input[name='supportedmethods']").map{|elem| elem.attribute("value").value},

      fields: fields
    }
  end
end

resources = ExactDocumentationParser.new.run.resources
byebug
a = 1
