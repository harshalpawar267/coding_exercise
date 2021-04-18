class UsersController < ApplicationController
  def index
    user = current_user;
    if user.admin?
      @users = User.all()
    else user.developer?
      @users = User.where(:id =>user.id)
    end
  end
end
