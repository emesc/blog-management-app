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