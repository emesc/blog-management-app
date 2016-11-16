class SubjectsController < ApplicationController

  layout :user_layout

  def show
    # find all sections scoped through subject model
    @subject = Subject.find(params[:id])
    # long solution
    # @sections = Section.where("subject_id = ? AND complete = ?", @subject.id, false)
    # short solution, dynamic find through association
    # @sections = @subject.sections.where(complete: false)
    # update above line since this find is moved to the model, with sorting
    @sections = @subject.sections.incomplete

    render json: @sections
  end

  def index
    # to check if all subjects are valid
    @subjects = Subject.all
    # subjects.all?(&:valid?)
    # to check if any subject is valid
    # subjects.any?(&:valid?)
    # save all subjects
    # subjects.each(&:save!)
    # return an array of upcased titles
    # @subjects = Subject.all.collect(&:title).collect(&:upcase)

    # just show the list as json
    # render json: @subjects
    # use subjects layout only for a specific action
    # render layout: "subjects"
    # dont use any layout
    # render layout: false
  end

  private

    # control layouts based on user
    def user_layout
      # if current_user.admin?
      # since there's no user resource yet
      if false
        "admin"
      else
        "application"
      end
    end

end
