# A concern is only responsible for a focused subset of the model's responsibility.
# The methods in our concern will all be related to the visibility of a model
# This is where we store all of the status methods that were duplicated in the models

module Visible

    # We can add our status validation to the concern, but this is slightly more complex as validations are methods called at the class level.
    # The ActiveSupport::Concern (API Guide) gives us a simpler way to include them: (https://api.rubyonrails.org/v6.1.3.2/classes/ActiveSupport/Concern.html)
    extend ActiveSupport::Concern
    
    # Now, we can remove the duplicated logic from each of the articles and commendts models,
    # and instead include our new Visible module here
    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    # Class methods can also be added to concerns.
    # If we want a count of public articles or comments to display on our main page,
        # then we might add a class method to Visible as follows:
    class_methods do
        def public_count
            where(status: 'public').count
        end
    end
    
    def archived?
        status === 'archived'
    end
end