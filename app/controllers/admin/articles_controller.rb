# coding: utf-8
class Admin::ArticlesController < Admin::Base
  def index
    @articles = Article.order("created_at DESC").paginate(page: params[:page], per_page: 15)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new()
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.assign_attributes(start_date: Time.now)
    if @article.save
      redirect_to [:admin, @article], notice: "ニュース記事を登録しました。"
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if @article.save
      redirect_to [:admin, @article], notice: "ニュース記事を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :admin_articles, notice: "ニュース記事を削除しました。"
  end

end
