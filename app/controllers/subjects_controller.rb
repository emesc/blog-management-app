class SubjectsController < ApplicationController

  def show
    # find all sections scoped through subject model
    @subject = Subject.find(params[:id])
    # long solution
    # @sections = Section.where("subject_id = ? AND complete = ?", @subject.id, false)
    # short solution, dynamic find through association
    # @sections = @subject.sections.where(complete: false)
    # update above line since this find is moved to the model, with sorting
    @sections = @subject.sections.find_incomplete

    render json: @sections
  end
end
