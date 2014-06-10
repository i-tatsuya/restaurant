class CoursesController < ApplicationController
  def index
    @courses = Course.order("id")
  end
  def show
    @course = Course.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "courses/show"
    end
  end

  private
  # 画像送信
  def send_image
    if @course.image.present?
      send_data @course.image.data, type: @course.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
