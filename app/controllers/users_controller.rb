class UsersController < ApplicationController
  def index
    render partial:"list_user"
  end
end