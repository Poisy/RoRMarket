module Api
  class ProductController < ApplicationController

    def get_all
      render json: {
        status: "SUCCESS",
        data: Product.active.with_brand_info
      }
    end

    def get_by_id
      render json: {
        status: "SUCCESS",
        data: Product.active.with_brand_info.find_by(id: params["id"])
      }
    end
  end
end