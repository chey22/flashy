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

  # the `new` action instantiates a new article, but does not save it
  # this article will be used in the view when building the form
  # by default, the `new` action will render app/views/articles/new.html.erb, so need to create that file
  # found at http://localhost:3000/articles/new
    # GET /articles/new request is mapped to the new action.
    # The new action does not attempt to save @article. Therefore, validations are not checked
  def new
    @article = Article.new
  end  

  # the create action instantiates a new article with values for the title and body
  # when we submit the new form, the POST /articles request is mapped to the create action
  # create action does attempt to save @article. Therefore, validations are checked.
    # If any validation fails, @article will not be saved, and app/views/articles/new.html.erb will be rendered with error messages.
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # edit action fetches the article from the database, and stores it in @article so that it can be used when building the form.
    # by default, the edit action will render app/views/articles/edit.html.erb
  def edit
    @article = Article.find(params[:id])
  end

  # update action (re-)fetches the article from the database, and attempts to update it with the submitted form data filtered by article_params
    # If no validations fail and the update is successful, the action redirects the browser to the article's page.
    # Else, the action redisplays the form, with error messages, by rendering app/views/articles/edit.html.erb
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # our resourceful routing (resources :articles) already provides the route,
    # which maps DELETE /articles/:id requests to the destroy action of ArticlesController
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  # strong params (more info at https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)
    # submitted form data is put into the params Hash, alongside captured route parameters
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
