require './test/test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Categoty should be valid" do 
    @category = Category.new(name: "Sports")
    assert @category.valid?
  end
end
