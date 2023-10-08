module Api
  class IssueController < ApplicationController
    def create
      product_id = params[:product_id]
      reference_number = params[:reference_number]

      if product_id.nil?
        render json: { status: "ERROR", message: "product_id field is required" }
      elsif reference_number.nil?
        render json: { status: "ERROR", message: "reference_number field is required" }
      else
        card = Card.available.find_by(product_id: product_id)
        if card.nil?
          render json: { status: "ERROR", message: "No available cards have product_id equal to #{product_id}" }
        else
          card.update(status: "issued")
          render json: { status: "SUCCESS", data: card.as_json(include: :transactions) }
        end
      end
    end
  end
end