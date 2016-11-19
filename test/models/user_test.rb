require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # METHOD1
  # def setup
  #   @user1 = users(:john)
  #   @user2 = users(:jane)
  #   @user3 = users(:bob)
  # end

  # test "full name without middle initial" do
  #   user = @user1
  #   assert_equal "John Doe", user.full_name
  # end

  # test "full name with middle initial" do
  #   user = @user2
  #   assert_equal "Jane D. Doe", user.full_name
  # end

  # test "full name with blank middle initial" do
  #   user = @user3
  #   assert_equal "Bob Dylan", user.full_name
  # end

  # METHOD2
  def full_name(first, middle, last, password='password')
    User.new(first_name: first, middle_initial: middle, last_name: last).full_name
  end

  test "full name" do
    assert_equal "John Doe", full_name('John', nil, 'Doe'), "nil MI"
    assert_equal "Jane D. Doe", full_name('Jane', 'D', 'Doe'), "with MI"
    assert_equal "Bob Dylan", full_name('Bob', '','Dylan'), "blank MI"
  end
end
