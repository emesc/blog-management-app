class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :products

  validates_presence_of :full_name
  before_validation :assign_role
  ##################################################
  # FOR 1-1 MAPPING BETWEEN VIEW AND DB TABLE FIELDS
  # def full_name
  #   # METHOD1
  #   # since you're inside the model, there's no need to call the method through the user
  #   name = first_name + " "
  #   name << "#{middle_initial}. " unless middle_initial.blank?
  #   name << last_name
  #   name
  #   # METHOD2
  #   # not good to do the following in terms of performance, but let's try anyway
  #   # compact method gets rid of null values in the array
  #   # [first_name, middle_initial_with_period, last_name].compact.join(' ')
  # end

  # def middle_initial_with_period
  #   # nil? checks if it's a nil value, blank? checks if it's blank or a nil value
  #   "#{middle_initial}." unless middle_initial.blank?
  # end
  ##################################################

  # FOR USING VIRTUAL ATTRIBUTES
  # getter
  def full_name
    [first_name, last_name].join(' ')
  end

  # setter
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  # default user to "Regular" role upon sign up
  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
end
