class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :check_exist_products, only: :destroy

  def index
    @search = Category.search params[:q]
    @categories = @search.result.page(params[:page]).per Settings.per_page
    if @categories.blank?
      flash[:alert] = "There are no category"
      redirect_to admin_categories_path
    end
  end

  def show
    if @category.present?
      @products = Product.in_category(params[:category_id])
    else
      flash[:alert] = "There are no product"
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create successfully"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Edit successfully"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Delete success"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :title
  end

  def check_exist_products
    if @category.products.any?
      flash[:danger] = "This category has book"
      redirect_to admin_categories_path
    end
  end
end
