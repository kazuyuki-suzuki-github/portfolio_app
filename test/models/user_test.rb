require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    #@user = User.new(name:"suzuki", email:"sample@test.com")
  end
  
  test "valid" do
    user = User.new(name:"suzuki", email:"sample@test.com")
    assert @user.valid?
  end
end
