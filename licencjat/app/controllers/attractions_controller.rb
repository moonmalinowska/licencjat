class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]



  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Attraction.all
  end

  def tagged

    if params[:tag].present?
      @attractions = Attraction.tagged_with(params[:tag])
    else
      @attractions = Attraction.all.order("created_at DESC")
    end
  end



  # GET /attractions/1
  # GET /attractions/1.json
  def show

    @attractions = Attraction.tagged_with(params[:tag])
    @hash = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction.latitude
      marker.lng attraction.longitude
      marker.infowindow attraction.name
      marker.picture({
                         "url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
                         "width" => 32,
                         "height" => 32
                     })
    end
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction }
      else
        format.html { render :edit }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :description, :address, :opening_hour, :duration, :reservation,
                                         :more_info, :picture, :url, :category_id, :region_id, :latitude, :longitude,
                                         :tag_list, :tag)
    end
  def activeadmin_resource?
    self.class.ancestors.include? ActiveAdmin::BaseController
  end
end
