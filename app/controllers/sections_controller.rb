class SectionsController < ApplicationController

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
    @sections = Section.complete.limit(2)
    # render json: @sections
  end
end
