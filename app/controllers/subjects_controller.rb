class SubjectsController < ApplicationController

  def show
    # find all sections scoped through subject model
    @subject = Subject.find(params[:id])
    # long solution
    # @sections = Section.where("subject_id = ? AND complete = ?", @subject.id, false)
    # short solution, dynamic find through association
    @sections = @subject.sections.where(complete: false)

    render json: @sections
  end
end
