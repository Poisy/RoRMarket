module Api
  class CardController < ApplicationController
    def get_by_id
      card = Card.issued.find_by(id: params["id"])

      if card.nil?
        return render json: {
          status: "ERROR",
          message: "No card with id of #{params["id"]}"
        }
      end

      render json: {
        status: "SUCCESS",
        data: CurrencyHelper.add_formatted_currency(card.attributes)
      }
    end
  end
end