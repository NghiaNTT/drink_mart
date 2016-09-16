class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @search = User.search(params[:q])
    @users = @search.result.order(updated_at: :desc).page(params[:page])
      .per Settings.per_page
  end

  def show
    @user ||= current_user
  end
end
