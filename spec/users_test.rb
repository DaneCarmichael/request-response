require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/users.rb'

class UsersTest < MiniTest::Test
  def setup
    @users = Users.new
  end
  def test_users_zero
    expected = {
      :first_name => "Dane",
      :last_name => "Carmichael",
      :age => 30
    }
    assert_equal(expected, @users.users[0] )
  end
end
