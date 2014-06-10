# coding: utf-8
class Admin::CoursesController < Admin::Base
  def index
    @courses = Course.order("id")
  end
  def show
    @course = Course.find(params[:id])
    p params[:id]
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "admin/courses/show"
    end
  end

  def new
    @course = Course.new
    @course.build_image
    p @course.image
  end

  def edit
    @course = Course.find(params[:id])
    @course.build_image unless @course.image
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to [:admin, @course], notice: "コースを作成しました"
    else
      render "new"
    end
  end

  def update
    @course = Course.find(params[:id])
    @course.assign_attributes(params[:course])
    if @course.save
      redirect_to [:admin, @course], notice: "コース情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to :admin_courses, notice: "コースを削除しました"
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
