module Api
  module Wogi
    class ProductController < ApplicationController
      def get_all
        render json: send_request
      end

      def get_by_id
        render json: send_request(params["id"])
      end


      private def send_request(id="")
        username = params["username"]
        password = params["password"]

        if username.nil? || password.nil?
          return { status: "ERROR", message: "Please provide username and password" }
        end

        credentials = Base64.encode64("#{username}:#{password}").strip
        response = HTTParty.get(
          "https://gateway.wogi.dev/api/v1/product_lines/#{id}",
          headers: { 'Authorization' => "Basic #{credentials}" }
        )

        if response.code.eql? 401
          { status: response.code, message: "Invalid username or password" }
        else
          response.body
        end
      end
    end
  end
end
