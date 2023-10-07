module Api
  class BrandController < ApplicationController

    def get_all
      render json: { status: "SUCCESS", data: Brand.active }
    end

    def get_by_id
      render json: { status: "SUCCESS", data: Brand.active.find_by(id: params["id"]) }
    end
  end
end