class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show]

  # GET /creators
  def index
    # TODO: validate params
    limit = params[:limit] ? params[:limit] : 100
    sort = params[:sort] ? params[:sort] : 'id'
    sort_direction = params[:sort_direction] ? params[:sort_direction] : 'asc'
    offset = params[:offset] ? params[:offset] : 0
    @creators = Creator.all.limit(limit).order(sort + " " + sort_direction).offset(offset)

    render json: @creators
  end

  # GET /creators/1
  def show
    render json: @creator
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def creator_params
      params.require(:creator).permit(:first_name, :last_name)
    end

end
