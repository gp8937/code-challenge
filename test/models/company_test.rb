require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "population of address fields" do
    company = Company.new name: "Test", zip_code: "93003", email: "hello@getmainstreet.com"
    assert company.validate
    assert_equal "Ventura", company.city
    assert_equal "CA", company.state
  end

  test "zip code validation" do
    company = Company.new name: "Test", email: "hello@getmainstreet.com", zip_code: "000"
    assert_not company.validate
    assert_nil company.city
    assert_nil company.state
    assert_includes company.errors[:zip_code], "not a valid US zip code"
  end

  test "email validation" do
    company = Company.new name: "Test", email: "test@gmail.com", zip_code: "000"
    assert_not company.validate
    assert_includes company.errors[:email], "domain is expected to be getmainstreet.com"
  end
end
