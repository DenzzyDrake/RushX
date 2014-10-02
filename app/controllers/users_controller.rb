class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    if params[:search]
     @users = User.search(params[:search]).order("created_at DESC")
    else
     @users = User.all.order('created_at DESC')
    end
  end

  def show
    @user = User.find(params[:id])
    @resumes = Resume.all
    @covers = Cover.all
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end
