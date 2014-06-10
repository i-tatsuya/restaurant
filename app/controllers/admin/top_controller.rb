# coding: utf-8

class Admin::TopController < Admin::Base
  def index
    @reservations = Reservation.where(date: Time.now.strftime("%Y-%m-%d")).order("created_at DESC").paginate(page: params[:page], per_page: 15)
  end
end
