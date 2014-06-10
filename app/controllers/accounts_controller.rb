#coding:utf-8
class AccountsController < ApplicationController
  before_filter :login_required

  def show
    @user = @current_user
    @reservations = Reservation.where(user_id: @user).where("date >= ?", Time.current.yesterday)
  end

  def update
    @user = @current_user
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to :account,notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def edit
    @user = @current_user
  end
end
