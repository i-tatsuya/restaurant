# coding: utf-8

class UsersController < ApplicationController
  def new
    @user = User.new(birthday: Date.new(1980,1,1),administrator: 0)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render "complete"
    else
      render "new"
    end
  end
end
