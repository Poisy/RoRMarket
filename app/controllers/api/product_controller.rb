module Api
  class ProductController < ApplicationController
    def get_all
      products = Product.active.with_brand_info.map { |p| p.attributes }
      products.each { |p| CurrencyHelper.add_formatted_currency p }

      render json: {
        status: "SUCCESS",
        data: products }
    end

    def get_by_id
      product = Product.active.with_brand_info.find_by(id: params["id"])

      if product.nil?
        return render json: {
          status: "ERROR",
          message: "No product with id of #{params["id"]}"
        }
      end

      render json: {
        status: "SUCCESS",
        data: CurrencyHelper.add_formatted_currency(product.attributes)
      }
    end
  end
end