class SubjectsController < ApplicationController

  layout :user_layout
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

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

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if params[:preview_button] || !@subject.save
      render 'new'
    else
      flash[:notice] = "Subject created successfully"
      redirect_to subject_path(@subject)
    end
  end

  def edit
    
  end

  def update
    # for preview button to work in edit mode, otherwise, preview renders and form switches to what was previously saved
    @subject.attributes = subject_params
    if params[:preview_button] || !@subject.update_attributes(subject_params)
      render 'edit'
    else
      flash[:notice] = "Subject successfully updated."
      redirect_to subjects_path
    end
  end

  def show
    # find all sections scoped through subject model
    # @subject = Subject.find(params[:id])
    # long solution
    # @sections = Section.where("subject_id = ? AND complete = ?", @subject.id, false)
    # short solution, dynamic find through association
    # @sections = @subject.sections.where(complete: false)
    # update above line since this find is moved to the model, with sorting
    # @sections = @subject.sections.incomplete

    # render json: @sections
    @sections = @subject.sections
  end

  def destroy
    @subject.destroy
    flash[:notice] = "Subject deleted successfully."
    redirect_to subjects_path
  end

  private

    def find_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:title, :description)
    end

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
