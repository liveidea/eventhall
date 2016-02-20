class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]


  def index
    if params[:city].blank?
      @halls = Hall.order(:name).page(params[:page]).per(9)
    else
      @city_id = City.find_by(name: params[:city]).id
      @halls = Hall.joins(:city).where(:city => {id: @city_id}).page(params[:page]).per(9)
    end

    if params[:venue_type].blank?
      @halls = Hall.order(:name).page(params[:page]).per(9)
    else
      @venue_type_id = VenueType.find_by(name: params[:venue_type]).id
      @halls = Hall.joins(:venue_types).where(:venue_types => {id: @venue_type_id}).page(params[:page]).per(9)
    end

    if params[:event_type].blank?
      @halls = Hall.order(:name).page(params[:page]).per(9)
    else
      @event_type_id = EventType.find_by(name: params[:event_type]).id
      @halls = Hall.joins(:event_types).where(:event_types => {id: @event_type_id}).page(params[:page]).per(9)
    end

  end



  def show
  end

  def new
    @hall = Hall.new
    @cities = City.all
    @venue_types = VenueType.all.map{|v| [v.name, v.id]}
    @event_type = EventType.all.map{|e| [e.name, e.id]}
  end

  def edit
     @cities = City.all
     # @city = City.find_by_id(params[:id])
      #@venue_types = VenueType.all
     @venue_type = VenueType.find_by_id(params[:id])
  end


  def create
    @hall = Hall.create(hall_params)
    @cities = City.all
     @venue_types = VenueType.all
    @hall.venue_type_ids = params[:venue_type_ids]
    @hall.event_type_ids = params[:event_type_ids]
    respond_to do |format|
      if @hall.save
        format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
        format.json { render :show, status: :created, location: @hall }
      else
        format.html { render :new }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @venue_types = VenueType.all.map{|v| [v.name, v.id]}
    @event_type = EventType.all.map{|e| [e.name, e.id]}
    respond_to do |format|
      if @hall.update(hall_params)
        format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
        format.json { render :show, status: :ok, location: @hall }
      else
        format.html { render :edit }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hall.destroy

    respond_to do |format|
      format.html { redirect_to halls_url, notice: 'Hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    def set_hall
      @hall = Hall.find(params[:id])
    end

    def hall_params
       params.require(:hall).permit(:description, :price, :photos, :name, :city, :city_id, :venue_type,  :event_type, :event_type_ids => [], :venue_type_ids => [] )
    end
end
