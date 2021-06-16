class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # The show action calls Article.find with the ID captured by the route parameter.
  # The returned article is stored in the @article instance variable, so it is accessible by the view.
  # By default, the show action will render app/views/articles/show.html.erb
  # Now go create that file.
  def show
    @article = Article.find(params[:id])
  end
end
