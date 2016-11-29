##############################
# RYAN BATES'S RAILSCASTS
# concepts learnt from episodes in ascending order
##############################

##############################
# ActiveRecord::Calculations
# http://api.rubyonrails.org/classes/ActiveRecord/Calculations.html
# sample calculations
##############################
Section.first.priority
Section.total(:priority)
Section.sum(:priority)
Section.minimum(:priority)
Section.maximum(:priority)
subject = Subject.first
subject.sections.first.priority
subject.sections.maximum(:priority)
# return the topmost priority from unfinished sections
subject.sections.where(complete: false).minimum(:priority)

##############################
# Find conditions
# https://stackoverflow.com/questions/21435768/rails-console-find-users-by-array-of-ids
# http://guides.rubyonrails.org/active_record_querying.html#array-conditions
# sample queries
# see sections_controller.rb for eager loading
##############################
subject = Subject.first
# priority is null
subject.sections.where(priority: nil)
# will only return the first item on the list
subject.sections.find_by_priority(1..10)
# using a range
# following 2 are the same
subject.sections.where(["complete = ? and priority in (?)", false, (1..10).to_a])
subject.sections.where(["complete = ? and priority in (?)", false, 1..10])
subject.sections.where(complete: false).where(priority: 1..10)
# using an array for particular priorities
subject.sections.where(["complete = ? and priority in (?)", false, [3, 9]])
subject.sections.where(complete: false).where(priority: [3, 9])
# passing a hash condition
subject.sections.where({complete: false, priority: 1..10})

##############################
# Eager loading for better performance
# 
# 
# sample queries
# see products_controller.rb
# git commit -m 'Used eager loading on products and sections indices.'
##############################
def index
  # initial
  @products = Product.all
  # reduce the number of calls to the db by eager loading
  # use the name of the association, belongs_to :user in the Product model
  @products = Product.all.includes(:user)
  # add another
  # use the name of the association, has_many :categories in the Product model
  @products = Product.all.includes(:user, :categories)
end

##############################
# Has many through checkboxes
# 
# 1) products/_form.html.erb
# 2) products_controller.rb
# git commit -m 'Added categorisation.'
##############################
# 1
# returns nil if no checkbox is ticked; otherwise, it wont update the category_ids[] attr
hidden_field_tag "product[category_ids][]", nil
# note the [] after category_ids - important for passing a collection through the controller
# boolean at the end to tick those that were previously set
check_box_tag "product[category_ids][]", category.id, @product.categories.include?(category)
# 2
# permit the category_ids attribut with [] for the same reason as above
permit(..., category_ids: [])

##############################
# looping through flash
# http://apidock.com/rails/ActionView/Helpers/TagHelper/content_tag
# application.html.erb
# git commit -m 'Updated flash message in the layout.'
##############################
# content_tag(name, content/option with block, options)
# returns an HTML block tag of type <name> surrounding the <content>
# add HTML attributes by passing an attributes has to options
# edit options according to css selector, eg, id: "flash-#{key}"
flash.each do |key, msg|
  content_tag :div, msg, id: key

##############################
# counter cache column
# 1) subjects/index.html.erb
# size vs length vs count
# http://work.stevegrossi.com/2015/04/25/how-to-count-with-activerecord/
# http://mensfeld.pl/2014/09/activerecord-count-vs-length-vs-size-and-what-will-happen-if-you-use-it-the-way-you-shouldnt/
# 2) add_sections_count_to_subjects.rb (migration file)
# Ryan Bates's code is working, if it doesn't the first time, try rails db:reset and then reseed
# 3) section.rb
# git commit -m 'Added sections counter to subjects.'
##############################
# 1 
@subjects.each do |subject|
  pluralize(subject.sections.size, 'section'
# 2
# default to 0 to work properly
# add_column tablename, modelassociationname_count, type, default: 0
add_column :subjects, :sections_count, :integer, default: 0
# set the value of the count column in each current subject
# for no of tasks, used length rather than size
# size would use the counter cache column which would have its default value of zero
Subject.all.each do |s|
  s.update_attribute(:sections_count, s.sections.length)
# to avoid the possibility of caching column info,
# reset Subject column info since it's being modified in the same migration in which we add a column
Subject.reset_column_information
# 3
# tell Rails to use sections_count column as counter cache column
belongs_to :subject, counter_cache: true

##############################
# SEARCH BOX IN SECTIONS
# 1) section.rb
# 2) sections_controller.rb
# 3) products_controller.rb
# git commit -m 'Added search in sections from UI.'
##############################
# 1
# changed default scope to list incomplete sections then accdg to priorities.
# tried to add another scope using order() at the bottom of default_scope ordered by creation date but not working
# that another scope works only if default is commented/removed so i chained the 2 order methods
default_scope -> { order(complete: :asc).order(priority: :asc) }
# 2
# if using only the sql like search, N+.. queries are generated
# @sections = Section.where("title LIKE ? OR body LIKE ?", "%#{params[:search_param]}%", "%#{params[:search_param]}%")
# joins-select performs better, but i havent tried it w eager loading
# must specify which title the query belongs to as subject also has title attribute
@sections = Section.joins(:subject).select("sections.*, subjects.title as subject_title").where("sections.title LIKE ? OR sections.body LIKE ?", "%#{params[:search_param]}%", "%#{params[:search_param]}%")
# use subject_title in sections/index view
section.subject_title
# let user know if no match found; why is <% if @sections %> not working?
if @sections.present?

##############################
# XSS
# Rails 5 auto sanitizes contents from user
# https://stackoverflow.com/questions/7861971/generate-model-using-userreferences-vs-user-idinteger
##############################
# you can try to escape user input in the console
> CGI::escapeHTML("<script>alert(document.cookie);</script>")
=> "&lt;script&gt;alert(document.cookie);&lt;/script&gt;"
# user_id vs user:references in rails generate model
# both will add section_id when you run the migration
$ rails g model comment content:text section:integer
# but below will add a belongs_to :section in the Comment model
# ActiveRecord will assume that the foreign key is kept in the section_id column and it will use a model named Section to instantiate the related section
# below will also add an index on the new section_id column
$ rails g model comment content:text section:references
