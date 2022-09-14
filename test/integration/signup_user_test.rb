require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest

  test "get the signup form and create user" do
    get "/signup"
    assert_response :success
    assert_difference "User.count", 1 do 
      post users_path, params: { user: { username: "Jonh Doe", email: "johndoe@mail.com", password: "123" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Jonh Doe", response.body
  end

  test "get the signup form and reject invalid params submission" do
    get "/signup"
    assert_response :success
    assert_no_difference "User.count" do 
      post users_path, params: { user: { username: " " } }
    end
    assert_match "errors", response.body
    assert_select "div.alert"
    assert_select "h4.alert-heading"
  end

end