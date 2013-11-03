require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { credit_card_billing_address: @user.credit_card_billing_address, credit_card_month: @user.credit_card_month, credit_card_no: @user.credit_card_no, credit_card_type: @user.credit_card_type, credit_card_verification_value: @user.credit_card_verification_value, credit_card_year: @user.credit_card_year, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, name: @user.name, password_digest: @user.password_digest }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { credit_card_billing_address: @user.credit_card_billing_address, credit_card_month: @user.credit_card_month, credit_card_no: @user.credit_card_no, credit_card_type: @user.credit_card_type, credit_card_verification_value: @user.credit_card_verification_value, credit_card_year: @user.credit_card_year, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, name: @user.name, password_digest: @user.password_digest }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
