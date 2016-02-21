class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]


  def index

    @halls = Hall.order(:name).page(params[:page]).per(9)
    @city = City.all
    @venue_type = VenueType.all
    @event_type = EventType.all

    if params[:city]
      city = City.find_by(name: params[:city])
      # @halls = Hall.search(params[:search]).order("created_at DESC")
      @halls = @halls.where(:city => city)
    else
      @halls = Hall.order(:name).page(params[:page]).per(9)
    end

    # unless params[:city].blank?
    #   city = City.find_by(name: params[:city])
    #   @halls = @halls.where(:city => city)
    # end


    unless params[:event_type].blank?
      event_type = EventType.find_by(name: params[:event_type])
      @halls = @halls.joins(:event_types).where(:event_types => {id: event_type}).page(params[:page]).per(9)
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
     # @venue_types = VenueType.all
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
