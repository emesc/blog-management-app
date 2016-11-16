require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # METHOD1
  def setup
    @user1 = users(:john)
    @user2 = users(:jane)
    @user3 = users(:bob)
  end
  # METHOD2
  # def full_name(first, middle, last, password='password')
  #   User.new(first_name: first, middle_initial: middle, last_name: last, password: password)
  # end

  test "full name without middle initial" do
    # METHOD1
    user = @user1
    assert_equal "John Doe", user.full_name
    # METHOD2
    # assert_equal "John Doe", full_name('John', nil, 'Doe')
  end

  test "full name with middle initial" do
    # METHOD1
    user = @user2
    assert_equal "Jane D. Doe", user.full_name
    # METHOD2
    # assert_equal "Jane D. Doe", full_name('Jane', 'D', 'Doe')
  end

  test "full name with blank middle initial" do
    # METHOD1
    # user = @/qual "Bob Dylan", user.full_name
    # METHOD2
    # assert_equal "Bob Dylan", full_name('Bob', '', 'Dylan')
  end

end
