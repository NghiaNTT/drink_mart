class ReviewsController < ApplicationController
  before_action :load_review, only: :destroy
  load_and_authorize_resource

  def new
    @review = Review.new
  end

  def create
    @new_review = current_user.reviews.build review_params
    if @new_review.save
      product = Product.find_by id: @new_review.product_id
      if product.present?
        average = Review.average_rate(@new_review.product_id).average :rate
        product.update_attributes average: average
      else
        flash[:danger] = "Rate fail"
        redirect_to products_path
      end
      flash[:success] = "Review successfully"
      redirect_to product_path(@new_review.product_id)
    else
      flash[:danger] = "Review fail"
      redirect_to products_path
    end
  end

  def destroy
    product = @review.product
    if @review.destroy
      flash.now[:success] = "Delete successfully"
      redirect_to product_path(product)
    else
      flash.now[:danger] = "Delete fail"
      redirect_to product_path(product)
    end
  end

  private
  def review_params
    params.require(:review).permit :id, :user_id, :product_id, :content, :rate
  end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review.present?
      flash.now[:danger] = t "views.message.not_found_review"
      redirect_to root_path
    end
  end
end
