Rails.application.routes.draw do
  root "articles#index"

  # # view that lists all articles in our database
  # get "/articles", to: "articles#index"

  # # view that shows the title and body of a single article
  #   # A route parameter of :id captures a segment of the request's path,
  #   # and puts that value into the params Hash,
  #   # which is accessible by the controller action.

  #   # For example, when handling a request like GET http://localhost:3000/articles/1,
  #   # 1 would be captured as the value for :id,
  #   # which would then be accessible as params[:id] in the show action of ArticlesController
  # get "/articles/:id", to: "articles#show"

  
  # method that maps all of the conventional routes for a collection of resources, such as articles
    # also makes the above 2 get methods obsolete
  # also sets up URL and path helper methods that we can use to keep our code from depending on a specific route configuration.
  # The values in the "Prefix" column (from running bin/rails routes) plus a suffix of _url or _path form the names of these helpers.
  # For example, the article_path helper returns "/articles/#{article.id}" when given an article
  resources :articles
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html