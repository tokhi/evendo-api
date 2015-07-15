require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: { address: @organization.address, city: @organization.city, country: @organization.country, email: @organization.email, name: @organization.name, telephone: @organization.telephone }
    end

    assert_response 201
  end

  test "should show organization" do
    get :show, id: @organization
    assert_response :success
  end

  test "should update organization" do
    put :update, id: @organization, organization: { address: @organization.address, city: @organization.city, country: @organization.country, email: @organization.email, name: @organization.name, telephone: @organization.telephone }
    assert_response 204
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_response 204
  end
end
