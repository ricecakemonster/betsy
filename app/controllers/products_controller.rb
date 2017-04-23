class ProductsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @products = Product.find_by(id: params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
