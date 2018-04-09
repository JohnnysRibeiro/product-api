require 'correios-frete'

require_relative '../helpers/product_helper'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :delivery]

  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # GET /products/delivery/:id [params]
  def delivery
  	@cep_origin = params[:cep_origin].strip
  	@cep_destiny = params[:cep_destiny].strip
  	@delivery_type = params[:delivery_type].strip

  	verify_delivery_type

    unless @delivery_type_is_valid
  		return json_response(@error_delivery_type, :unprocessable_entity)
  	end

  	get_freight
  	
  	if @data_is_valid
  		json_response(@product)
  	else
  		json_response(@error, :unprocessable_entity)
  	end
  end

  # PUT /products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.permit(:name, :description, :height, :weight, :width, :lenght, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
