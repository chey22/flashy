class Article < ApplicationRecord
    include Visible

    # association 
        # Each comment belongs to one article.
        # One article can have many comments.
    has_many :comments

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    # Now, we can remove the duplicated logic from each model and instead include our new Visible module inside models/concerns/visible.rb
    # VALID_STATUSES = ['public', 'private', 'archived']

    # validates :status, inclusion: { in: VALID_STATUSES }

    # def archived?
    #     status === 'archived'
    # end
end
