# coding: utf-8
class ReservationsController < ApplicationController
def show
  @reservation = Reservation.find(params[:id])
  if @current_user.id != @reservation.user_id
    raise NotFound
  end
end

def new
  @reservation = Reservation.new()
  @courses = Course.all
  @memorial = Memorial.all
end

def new2
  @courses = Course.all
  @memorial = Memorial.all
  @reservation = Reservation.new(params[:reservation])
  if @reservation.new1valid? == false
    redirect_to new_reservation_path, notice: "入力情報に誤りがあります。入力しなおしてください。"
  else
    @reservation.selected_seats.build
    @reservations = Reservation.where(date: @reservation.date.strftime("%Y-%m-%d")).where(time: @reservation.time)
    usedseats = []
    @reservations.each do |val|
      val.seats.each do |seat|
        usedseats << seat.id
      end
    end
    if @reservation.memorial
      Seat.where("value > ?", @reservation.persons * @reservation.course.price * @reservation.memorial.memorial_rate).each do |val|
        usedseats << val.id
      end
    else
      Seat.where("value > ?", @reservation.persons * @reservation.course.price).each do |val|
        usedseats << val.id
      end
    end
    @usedseats = usedseats
    @vacantseats = Seat.where{id << usedseats}.map{|m| m.id }
    if @vacantseats[0] == nil
      redirect_to new_reservation_path, notice: "席に空きがありませんでした。よろしければ選びなおしてください。"
    end
    @seatlim = []
    Seat.where{id << usedseats}.each do |s|
      @seatlim[s.id] = s.number
    end
    @seatlim.each_index do |index|
      if @seatlim[index] == nil
        @seatlim[index] = 0
      end
    end
  end
end

def confirm
  @reservation = Reservation.new(params[:reservation])
  if !@reservation.new2valid?
    redirect_to new_reservation_path, notice: "入力情報に誤りがありました。入力しなおしてください。"
  end
end

def create
  @reservation = Reservation.new(params[:reservation])
  if @reservation.save
    redirect_to @reservation, notice: "予約を完了しました"
  else
    render "new"
  end
end

def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  redirect_to "/account", notice: "予約をキャンセルしました"
end

end
