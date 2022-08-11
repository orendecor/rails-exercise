class GigPaymentsController < ApplicationController
  before_action :set_gig_payment, only: [:show, :update, :destroy]

  # GET /gig_payments
  def index
    @gig_payments = GigPayment.all

    render json: @gig_payments
  end

  # GET /gig_payments/1
  def show
    render json: @gig_payment
  end

  # POST /gig_payments
  def create
    @gig_payment = GigPayment.new(gig_payment_params)

    if @gig_payment.save
      render json: @gig_payment, status: :created, location: @gig_payment
    else
      render json: @gig_payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gig_payments/1
  def update
    if @gig_payment.update(gig_payment_params)
      render json: @gig_payment
    else
      render json: @gig_payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gig_payments/1
  def destroy
    @gig_payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig_payment
      @gig_payment = GigPayment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gig_payment_params
      params.require(:gig_payment).permit(:state, :gig_id)
    end
end
