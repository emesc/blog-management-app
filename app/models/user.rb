class User < ApplicationRecord

  def full_name
    # METHOD1
    # since you're inside the model, there's no need to call the method through the user
    name = first_name + " "
    name << "#{middle_initial}. " unless middle_initial.blank?
    name << last_name
    name
    # METHOD2
    # not good to do the following in terms of performance, but let's try anyway
    # compact method gets rid of null values in the array
    # [first_name, middle_initial_with_period, last_name].compact.join(' ')
  end

  def middle_initial_with_period
    # nil? checks if it's a nil value, blank? checks if it's blank or a nil value
    "#{middle_initial}." unless middle_initial.blank?
  end
end
