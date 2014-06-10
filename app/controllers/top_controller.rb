class TopController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def not_found
    raise ActionController::RoutingError,
      "No route matchs #{request.path.inspect}"
  end

end
