# bash command to generate new model:
  # rails generate model Comment commenter:string body:text article:references

# These two declarations enable a good bit of automatic behavior.
  # For example, if you have an instance variable @article containing an article, then
  # you can retrieve all the comments belonging to that article as an array using @article.comments

    class Comment < ApplicationRecord
  # the line belongs_to :article sets up an Active Record association
  belongs_to :article
end
