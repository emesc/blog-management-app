class CommentsController < ApplicationController
  def create
    section = Section.find(params[:section_id])
    section.comments.create(params.require(:comment).permit(:content))
    redirect_to section
  end
end
