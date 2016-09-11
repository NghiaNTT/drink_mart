class CategoriesController < ApplicationController
  load_and_authorize_resource

  def show
    if @category.present?
      @products = Product.in_category(params[:category_id])
    else
      flash[:alert] = "no product"
    end
  end

  def index
    @search = Category.search params[:q]
    @categories = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
    if @categories.blank?
      flash[:alert] = "No category"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit :title
  end
end
