class Admin::ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_products, only: [:edit, :update]
  before_action :find_categories, only: [:edit, :update]

  def index
    @products = Product.in_category params[:category_id]
    @search = @products.ransack params[:q]
    @products = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Product created"
      redirect_to admin_products_path
    else
      flash[:danger] = "Fail to create product"
      render :new
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = "Product edited"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product deleted"
    else
      flash[:danger] = "Fail to delete product"
    end
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :price,
      :category_id, :image, :quantity, :average
  end

  def load_products
    if @product.nil?
      flash[:danger] = "Invalid product"
      redirect_to product_path
    end
  end

  def find_categories
    @categories = Category.all
  end
end
