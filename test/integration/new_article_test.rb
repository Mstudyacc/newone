require "test_helper"

class NewArticleTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "Jonh Doe", email: "johndoe@mail.com", password: "123", admin: true)
    sign_in_as(@admin_user)
  end

  test "get the new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do 
      post articles_path, params: { article: { title: "Jonh Doe", description: "johndoe@mail.com" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Jonh Doe", response.body
  end

end
