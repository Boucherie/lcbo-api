require "json"

class InventoriesController < ApplicationController
  def index

    response = Typhoeus.get("http://lcboapi.com/inventories")

    parsed_json = JSON.parse(response.body)

    transformed_results = []

    parsed_json["result"].each do |inventory|
      transformed_results.push(
        {
          product_name: product_lookup(inventory["product_id"]),
          store_name: store_lookup(inventory["store_id"]),
          quantity: inventory["quantity"]
        }
      )
    end

    render json: transformed_results

    


    # Making an api
    # @inventories = [
    #   {product_name: "Coors Light", store_address: "123 Fake St.", quantity: 5},
    #   {product_name: "Coors Light", store_address: "123 Fake St.", quantity: 6},
    #   {product_name: "Coors Light", store_address: "123 Fake St.", quantity: 5}
    # ]
    #
    # render json: {
    #   inventories: @inventories
    # }
  end
  private

  def store_lookup(store_id)
    response = Typhoeus.get("http://lcboapi.com/stores/#{store_id}")
        parsed_json = JSON.parse(response.body)
    return parsed_json["result"]["name"]
  end

  def product_lookup(product_id)
    response = Typhoeus.get("http://lcboapi.com/products/#{product_id}")
        parsed_json = JSON.parse(response.body)
    return parsed_json["result"]["name"]
  end
end
