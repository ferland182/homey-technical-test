class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("comments-list", partial: "comments/comment", locals: { comment: @comment })
        end
        format.html { redirect_to @project, notice: "Comment added successfully!" }
      end
    else
      redirect_to @project, notice: "An error occurred!"
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.permit(:content, :project_id)
  end
end
