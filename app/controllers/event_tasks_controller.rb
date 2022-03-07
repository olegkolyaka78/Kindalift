class EventTasksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_event_task, only: %i[ show edit update destroy ]
  before_action :set_event, only: [ :update, :create ]
  before_action :set_address, only: [ :update, :create ]
  before_action :set_child, only: [ :update, :create ]
  before_action :set_caregiver, only: [ :update, :create ]
  #layout 'event_task_layout'

  # GET /event_tasks or /event_tasks.json
  def index
    @event_tasks = EventTask.all
    #render :index
  end

  # GET /event_tasks/1 or /event_tasks/1.json
  def show
    #@event_task = EventTask.find(params[:id])
    #render :show
  end

  # GET /event_tasks/new
  def new
    @event_task = EventTask.new
  end

  # GET /event_tasks/1/edit
  def edit
    #@event_task = EventTask.find(params[:id])
    #render :edit
  end

  # POST /event_tasks or /event_tasks.json
  def create
    #@event_task = EventTask.new(event_task_params)
    @event_task = @event.event_tasks.new(event_task_params)

    #respond_to do |format|
      if @event_task.save
        flash.notice = "The event task was created successfully."
        redirect_to @event
        #redirect_to events_url
        #format.html { redirect_to event_task_url(@event), notice: "Event task was successfully created." }
        #format.json { render :show, status: :created, location: @event }
        #format.html { redirect_to event_task_url(@event_task), notice: "Event task was successfully created." }
        #format.json { render :show, status: :created, location: @event_task }
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @event_task.errors, status: :unprocessable_entity }
        flash.now.alert = @event_task.errors.full_messages.to_sentence
        render :new
      end
    #end
  end

  # PATCH/PUT /event_tasks/1 or /event_tasks/1.json
  def update
    #@event_task = EventTask.find(params[:id])
    #respond_to do |format|
      if @event_task.update(event_task_params)
        #format.html { redirect_to event_task_url(@event_task), notice: "Event task was successfully updated." }
        #format.json { render :show, status: :ok, location: @event_task }
        flash.notice = "The event task was updated successfully."
        redirect_to event_task_path(@event_task)
      else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @event_task.errors, status: :unprocessable_entity }
        flash.now.alert = @event_task.errors.full_messages.to_sentence
        render :edit
      end
    #end
  end

  # DELETE /event_tasks/1 or /event_tasks/1.json
  def destroy
    #@event_task = EventTask.find(params[:id])
    @event_task.destroy
    redirect_to event_tasks_path


    respond_to do |format|
      format.html { redirect_to event_tasks_url, notice: "Event task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_event_task
      @event_task = EventTask.find(params[:id])
    end

    def set_event
      @event = Event.find(event_task_params[:event_id])
    end

    def set_child
      #@child = Child.find_by(params[:id])
      @child = Child.find(event_task_params[:child_id])
    end

    def set_caregiver
      @caregiver = Caregiver.find(event_task_params[:caregiver_id])
    end

    def set_address
      @address = Address.find(event_task_params[:address_id])
    end



    # Only allow a list of trusted parameters through.
    def event_task_params
      params.require(:event_task).permit(:name, :start_time, :pickup_address, :end_time, :dropoff_address, 
                                         :priority, :status, :child_id, :address_id,
                                         :event_id, :caregiver_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to events_url
    end

end
