class EstatesController < ApplicationController

  before_action :initiate_estate, only: [:update, :show, :destroy]
  before_action :estate_params, only: [:create, :update]

  def create
    estate = Estate.new(estate_params)
    if estate.save
      render json: estate, status: :created
    else
      render json: errors_list(estate), status: :unprocessable_entity
    end
  end

  def update
    if @estate && @estate.update(estate_params)
      render json: @estate, status: :ok
    else
      render json: errors_list(@estate), status: :unprocessable_entity
    end
  end

  def show
    if @estate
      render json: @estate, status: :found
    else
      render json: errors_list(@estate), status: :unprocessable_entity
    end
  end

  def destroy
    if @estate && @estate.destroy
      render json: { message: "Deleted successfully" }
    else
      render json: errors_list(@estate), status: :unprocessable_entity
    end
  end

  def paginating
    per_page = params[:per_page] ? params[:per_page] : Estate.per_page
    render json: Estate.paginate(:page=>params[:page], :per_page=> per_page), status: :ok
  end

  def search
    search_results = Estate.new.search(params[:type], params[:price], params[:sq_ft])
    render json: search_results, status: :ok
  end

  private
    def initiate_estate
      @estate = Estate.find_by_id(params[:id])
    end

    def estate_params
      params.require(:estate).permit(:street, :city, :zip, :state, :beds, :baths, :sq_ft, :estate_type, :sale_date, :price, :latitude, :longitude)
    end

    def errors_list(estate)
      resp = { message: "Couldn't add this estate" }
      unless estate
        resp[:errors] = ["This estate does not exists"]
      else
        resp[:errors] = estate.errors.full_messages
      end
      resp
    end
end
