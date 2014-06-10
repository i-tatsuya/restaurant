# coding: utf-8

class Admin::UsersController < Admin::Base
  def index
    @users = User.order("id").paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :admin_users, notice: "ユーザーを削除しました"
  end

  def search
    @users = User.search(params[:q]).paginate(page: params[:page], per_page: 15)
    render "index"
  end
end
