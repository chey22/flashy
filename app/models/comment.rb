# bash command to generate new model:
  # rails generate model Comment commenter:string body:text article:references

# These two declarations enable a good bit of automatic behavior.
  # For example, if you have an instance variable @article containing an article, then
  # you can retrieve all the comments belonging to that article as an array using @article.comments

  class Comment < ApplicationRecord
    include Visible
    # the line belongs_to :article sets up an Active Record association
    belongs_to :article

    # Now, we can remove the duplicated logic from each model and instead include our new Visible module inside models/concerns/visible.rb
    # VALID_STATUSES = ['public', 'private', 'archived']

    # validates :status, inclusion: { in: VALID_STATUSES }

    # def archived?
    #   status === 'archived'
    # end
end
