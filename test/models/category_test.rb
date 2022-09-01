require './test/test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end
  
  test "Categoty should be valid" do 
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be uniqe" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name shouldn't be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name shouldn;t be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

end
