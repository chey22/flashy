class CommentsController < ApplicationController
    def create
        # each request for a comment has to keep track of the article to which the comment is attached,
        # thus the initial call to the find method of the Article model to get the article in question
        @article = Article.find(params[:article_id])
        # `create` method for association
            # use the create method on @article.comments to create and save the comment.
            # This will automatically link the comment so that it belongs to that particular article
        @comment = @article.comments.create(comment_params)
        # once a comment is created, send the user back to the original article using the article_path(@article) helper,
        # which calls the show action of ArticlesController (so add that to the show file)
        redirect_to article_path(@article)
    end

    # The destroy action will find the article we are looking at, 
    # then locate the comment within the @article.comments collection, and
    # then remove it from the database and send us back to the show action for the article.
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end
end