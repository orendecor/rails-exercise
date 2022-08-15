class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :update]

  # GET /gigs
  def index
    brand_name = params[:brand_name]
    creator = params[:creator]

    if(brand_name)
      @gigs = Gig.find_by("brand_name"=> brand_name)
    elsif (creator)
      @gigs = Gig.find_by("creator"=> creator)
    else
      @gigs = Gig.all
    end

    render json: @gigs
  end

  # GET /gigs/1
  def show
    render json: @gig
  end

  # POST /gigs
  def create
    brand_name = params[:brand_name]
    # TODO: take creator from auth
    creator = Creator.last

    @gig = Gig.new("brand_name" => brand_name, "creator"=> creator)

    if @gig.save
      render json: @gig, status: :created, location: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      render json: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      @gig = Gig.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gig_params
      params.require(:gig).permit(:brand_name, :state, :creator_id)
    end
end
