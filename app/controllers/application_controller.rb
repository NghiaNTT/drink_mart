class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_order
    if !session[:order_id].nil?
      Order.find_by id: (session[:order_id])
    else
      Order.new
    end
  end
end
