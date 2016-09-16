class ProductsController < ApplicationController
  load_and_authorize_resource
  def index
    @products = Product.in_category params[:category_id]
    @search = @products.ransack params[:q]
    @products = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.products.per_page
  end

  def show
    if current_user.present?
      @new_review = current_user.reviews.build
    end
      @reviews = @product.reviews.order(updated_at: :desc)
       .page(params[:page]).per Settings.products.per_page
  end

  private
  def product_params
    params.require(:product).permit :id, :name, :price, :quantity,
      :category_id, :description, :average
  end
end
