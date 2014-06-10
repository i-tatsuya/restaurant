# coding: utf-8
class Admin::ReservationsController < Admin::Base
  def index
    @reservations = Reservation.order("created_at DESC").paginate(page: params[:page], per_page: 15)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :admin_reservations, notice: "予約を削除しました。"
  end

  def search
    if params[:q]
      @reservations = Reservation.searchdate(params[:q]).paginate(page: params[:page], per_page: 15)
      render "index"
    else
      @reservations = Reservation.searchname(params[:name]).paginate(page: params[:page], per_page:15)
      render "index"
    end
  end
end
