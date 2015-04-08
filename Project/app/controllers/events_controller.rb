class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    
    @events = Event.all
  end

  def userview
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show

  end
	 
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
     @wvent = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to(:action => 'show', :id => @event.id)
    else
      render('index')
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
      end


  private
    # Use callbacks to share common setup or constraints between actions.
     def set_event
      @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time)
    end
end
