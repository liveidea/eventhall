class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy, :checked]
  before_action :authenticate_user!, :except => [:show, :index, :team]
  before_action :own_hall, only: [:edit, :update]

  respond_to :html, :xml, :json


  def index
    @halls = Hall.order(:name).page(params[:page]).per(9)
    @city = City.all
    @venue_type = VenueType.all
    @event_type = EventType.all

    @selected_venue_types = VenueType.where(id: params[:venue_type])
    @selected_event_types = EventType.where(id: params[:event_type])


      if !params[:city].blank?
        session[:city] = params[:city]
        city = City.find_by(name: params[:city])
        @halls = @halls.where(:city => city)
      end

      if !params[:venue_type].blank?
        venue_types = VenueType.where(id: params[:venue_type])
        @halls = @halls.joins(:venue_types).where(:venue_types => {id: venue_types})
      end

      if !params[:event_type].blank?
        event_types = EventType.where(id: params[:event_type])
        @halls = @halls.joins(:event_types).where(:event_types => {id: event_types})
      end

  end

  def show
  end

  def new
    @hall = current_user.halls.build

     @cities = City.all
     @venue_types = VenueType.all
     @event_types = EventType.all
  end

  def edit
     @cities = City.all
     @venue_types = VenueType.all
     @event_types = EventType.all
  end


  def create
    @hall = current_user.halls.create(hall_params)
    @cities = City.all
    # @hall.venue_type_ids = params[:venue_type_ids]
    # @hall.event_type_ids = params[:event_type_ids]
    respond_to do |format|
      if @hall.save
        format.html { redirect_to @hall, notice: t('.notice') }
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
        format.html { redirect_to @hall, notice: t('.notice') }
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
      format.html { redirect_to halls_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  def team
  end




  private
    def set_hall
      @hall = Hall.find(params[:id])
    end

    def own_hall
      @hall = Hall.find params[:id]
      unless current_user == @hall.user
         redirect_to(@hall, notice: t('.notice') ) and return
      end
    end

    def hall_params
       params.require(:hall).permit(:description, :price, :photos, :name, :city, :city_id, :venue_type,  :event_type, :checked_hall, :event_type_ids => [], :venue_type_ids => [], :photos => [] )
    end
end
