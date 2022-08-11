require 'test_helper'

class GigPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gig_payment = gig_payments(:one)
  end

  test "should get index" do
    get gig_payments_url, as: :json
    assert_response :success
  end

  test "should create gig_payment" do
    assert_difference('GigPayment.count') do
      post gig_payments_url, params: { gig_payment: { gig_id: @gig_payment.gig_id, state: @gig_payment.state } }, as: :json
    end

    assert_response 201
  end

  test "should show gig_payment" do
    get gig_payment_url(@gig_payment), as: :json
    assert_response :success
  end

  test "should update gig_payment" do
    patch gig_payment_url(@gig_payment), params: { gig_payment: { gig_id: @gig_payment.gig_id, state: @gig_payment.state } }, as: :json
    assert_response 200
  end

  test "should destroy gig_payment" do
    assert_difference('GigPayment.count', -1) do
      delete gig_payment_url(@gig_payment), as: :json
    end

    assert_response 204
  end
end
