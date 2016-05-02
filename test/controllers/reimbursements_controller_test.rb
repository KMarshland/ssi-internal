require 'test_helper'

class ReimbursementsControllerTest < ActionController::TestCase
  setup do
    @reimbursement = reimbursements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reimbursements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reimbursement" do
    assert_difference('Reimbursement.count') do
      post :create, reimbursement: { credit_card: @reimbursement.credit_card, description: @reimbursement.description, status: @reimbursement.status, team: @reimbursement.team, value: @reimbursement.value }
    end

    assert_redirected_to reimbursement_path(assigns(:reimbursement))
  end

  test "should show reimbursement" do
    get :show, id: @reimbursement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reimbursement
    assert_response :success
  end

  test "should update reimbursement" do
    patch :update, id: @reimbursement, reimbursement: { credit_card: @reimbursement.credit_card, description: @reimbursement.description, status: @reimbursement.status, team: @reimbursement.team, value: @reimbursement.value }
    assert_redirected_to reimbursement_path(assigns(:reimbursement))
  end

  test "should destroy reimbursement" do
    assert_difference('Reimbursement.count', -1) do
      delete :destroy, id: @reimbursement
    end

    assert_redirected_to reimbursements_path
  end
end
