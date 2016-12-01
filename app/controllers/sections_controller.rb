class SectionsController < ApplicationController

  before_action :find_section, only: [:edit, :update, :show]

  # def incomplete
  #   # for retrieving a single recent record
  #   # @section = Section.find_by(complete: false)
  #   # for retrieving all records
  #   @sections = Section.where(complete: false)
  #   # convert to array
  #   # @sections = @sections.to_a
  # end

  # def latest_incomplete
  #   # using date
  #   # @section = Section.where(complete: false).order('created_at DESC').first
  #   # faster: using id since primary key is indexed
  #   @section = Section.where(complete: false).order('id DESC').first
  # end

  # def search_in_title(query='')
  #   # using first word, then convert to array
  #   # case insensitive
  #   # @sections = Section.where("title LIKE ?", "#{query}%").to_a
  #   # to be sure, since substring can be anywhere in the string
  #   @sections = Section.where("title LIKE ?", "%#{query}%").to_a
  # end

  def index
    # if this sort of find is performed on several actions
    # @sections = Section.where(complete: false).order('id DESC')
    # move it to the model to prevent duplication and then call
    # @sections = Section.complete.limit(2)
    # render json: @sections

    # EAGER LOADING
    # if it doesn't work, try add references method since it wasnt included in the migration when subject_id was added
    # look at the generated sql query
    # @sections = Section.preload(:subject)
    # will raise an exception
    # @sections = Section.preload(:subject).where("subjects.title = ?", "Food")
    # look at the generated sql query; uses LEFT OUTER JOIN
    # @sections = Section.eager_load(:subject)
    # look at the generated sql query; uses LEFT OUTER JOIN
    # @sections = Section.eager_load(:subject).where("subjects.title = ?", "Food")
    # look at the generated sql query; uses preload
    # @sections = Section.includes(:subject)
    # look at the generated sql query; uses eager_load
    # @sections = Section.includes(:subject).where("subjects.title = ?", "Food").references(:subject)
    # look at the generated sql query; uses INNER JOIN
    # @sections = Section.joins(:subject).select("sections.*, subjects.title as subject_title")
    # look at the generated sql query; uses INNER JOIN
    # @sections = Section.joins(:subject).select("sections.*, subjects.title as subject_title").where("subject_title = ?", "Food")
    # for search box in sections
    # look at the generated sql query vs without joins-select
    # specified which title the query belongs to
    @sections = Section.joins(:subject).select("sections.*, subjects.title as subject_title").where("sections.title LIKE ? OR sections.body LIKE ?", "%#{params[:search_param]}%", "%#{params[:search_param]}%")
    # detailed or list view
    @detailed = false
    # below will generate a hash which keys are a date representing the first day of a month and which values are an array of all the sections whose due date falls within that month
    @sections_by_month = @sections.group_by { |s| s.deadline.beginning_of_month }
  end
  
  def show
    @section = Section.find(params[:id])
    @comments = @section.comments
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to sections_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to section_path(@section)
    else
      render 'edit'
    end
  end

  private

    def section_params
      params.require(:section).permit(:title, :complete, :subject_id, :priority, :body, :deadline)
    end

    def find_section
      @section = Section.find(params[:id])
    end
end
