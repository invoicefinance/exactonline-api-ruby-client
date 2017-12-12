require 'spec_helper'

describe Elmas::SalesInvoiceLine do
  [
    :employee, :end_time, :line_number, :start_time, :subscription,
    :VAT_amount_DC, :VAT_amount_FC, :GL_account, :discount, :unit_price
  ].each do |attribute|
    normalized_attribute = Elmas::Utils.normalize_hash_key(attribute.to_s).to_sym

    # TODO: (Korstiaan) Fix specs.
    # context attribute.to_s do
    #   it "accepts attribute setter"  do
    #     sales_entry_line = Elmas::SalesInvoiceLine.new
    #     sales_entry_line.public_send("#{normalized_attribute}=", "78238")
    #     expect(sales_entry_line.public_send(normalized_attribute)).to eq "78238"
    #   end
    #
    #   it "returns value for getters"
    #    do
    #
    #     sales_entry_line = Elmas::SalesInvoiceLine.new({ "#{attribute}" => "345" })
    #     expect(sales_entry_line.public_send(normalized_attribute)).to eq "345"
    #   end
    # end
  end

  it "is valid with mandatory attributes" do
    sales_entry_line = Elmas::SalesInvoiceLine.new(item: "23", invoice_ID: "23299ask-2233")
    expect(sales_entry_line.valid?).to eq(true)
  end

  it "is not valid without mandatory attributes" do
    sales_entry_line = Elmas::SalesInvoiceLine.new
    expect(sales_entry_line.valid?).to eq(false)
  end
end
