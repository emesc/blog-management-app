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