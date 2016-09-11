class ProductsController < ApplicationController
  load_and_authorize_resource
  def index
    @products = Product.in_category params[:category_id]
    @search = @products.ransack params[:q]
    @products = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
  end

  private
  def book_params
    params.require(:product).permit :id, :name, :price, :quantity,
      :category_id, :description, :average
  end
end
