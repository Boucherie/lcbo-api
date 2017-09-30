require 'json'
class ProductsController < ApplicationController


  def index
    response = Typhoeus.get("http://lcboapi.com/products", followlocation: true)
    parsed_json = JSON.parse(response.body)
    @products = parsed_json['result']

    respond_to do |format|
      format.html {
        render :index
      }
      format.json {
        render json: @products, status: ok
      }
    end
  end
  
end
