module Elmas
  class SalesOrder
    include Elmas::Resource
    include Elmas::SharedSalesAttributes

    def base_path
      "salesorder/SalesOrders"
    end

    def mandatory_attributes
      [:sales_order_lines, :ordered_by]
    end

    def other_attributes
      SHARED_SALES_ATTRIBUTES.inject(
        [
          :deliver_to_contact_person, :delivery_date, :delivery_status,
          :salesperson, :shipping_method, :status, :tax_schedule, :warehouse_ID
        ],
        :<<
      )
    end
  end
end
