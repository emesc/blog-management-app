class SectionsController < ApplicationController

  def incomplete
    byebug
    # for retrieving a single recent record
    # @section = Section.find_by(complete: false)
    # for retrieving all records
    @sections = Section.where(complete: false)
    # convert to array
    # @sections = @sections.to_a
  end

  def recent_incomplete
    # using date
    # @section = Section.where(complete: false).order('created_at DESC').first
    # faster: using id since primary key is indexed
    @section = Section.where(complete: false).order('id DESC').first
  end

  def search_in_title(query='')
    # using first word, then convert to array
    @sections = Section.where("title LIKE ?", "#{query}%").to_a
  end
end
