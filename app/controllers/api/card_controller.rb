module Api
  class CardController < ApplicationController
    def get_by_id
      render json: { status: "SUCCESS", data: Card.issued.find_by(id: params["id"]) }
    end
  end
end