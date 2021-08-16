require "test_helper"

class ApplicationFormControllerTest < ActionDispatch::IntegrationTest
  test "should get applicant" do
    get application_form_applicant_url
    assert_response :success
  end
end
