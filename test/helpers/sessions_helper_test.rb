require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user) # DB + cookies
  end

  test "curent_user returens right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "curent_user returens nil when remember_digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
