class EventsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_child, only: [ :update, :create ]
  before_action :set_address, only: [ :update, :create ]
  before_action :set_event_task, only: [ :update, :create ]

  # GET /events or /events.json
  def index
    @events = Event.all
    #@events = Event.order(params[:sort])
    #render template: "events/index.html.erb", layout: "application"
    render :index
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    #respond_to do |format|
      if @event.save
        #format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        #format.json { render :show, status: :created, location: @event }
        flash.notice = "The event was created successfully."
        redirect_to @event
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @event.errors, status: :unprocessable_entity }
        flash.now.alert = @event.errors.full_messages.to_sentence
        render :new  
      end
    #end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    #respond_to do |format|
      if @event.update(event_params)
        #format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        #format.json { render :show, status: :ok, location: @event }
        flash.notice = "The event record was updated successfully."
        redirect_to @event
      else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @event.errors, status: :unprocessable_entity }
        flash.now.alert = @event.errors.full_messages.to_sentence
        render :edit
      end
    #end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_address
      @address = Address.find(event_params[:address_id])
    end

    def set_child
      @child = Child.find(event_params[:child_id])
    end

    def set_event_task
      @event_task = EventTask.find(event_params[:event_task_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :child_id, :address_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to events_path
    end
end
