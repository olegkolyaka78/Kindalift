class CaregiversController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_caregiver, only: %i[ show edit update destroy ]
  before_action :set_address, only: [ :update, :create ]

  # GET /caregivers or /caregivers.json
  def index
    @caregivers = Caregiver.all
  end

  # GET /caregivers/1 or /caregivers/1.json
  def show
  end

  # GET /caregivers/new
  def new
    @caregiver = Caregiver.new
  end

  # GET /caregivers/1/edit
  def edit
  end

  # POST /caregivers or /caregivers.json
  def create
    @caregiver = Caregiver.new(caregiver_params)

    respond_to do |format|
      if @caregiver.save
        format.html { redirect_to caregiver_url(@caregiver), notice: "Caregiver was successfully created." }
        format.json { render :show, status: :created, location: @caregiver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caregiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caregivers/1 or /caregivers/1.json
  def update
    respond_to do |format|
      if @caregiver.update(caregiver_params)
        format.html { redirect_to caregiver_url(@caregiver), notice: "Caregiver was successfully updated." }
        format.json { render :show, status: :ok, location: @caregiver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caregiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caregivers/1 or /caregivers/1.json
  def destroy
    @caregiver.destroy

    respond_to do |format|
      format.html { redirect_to caregivers_url, notice: "Caregiver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caregiver
      @caregiver = Caregiver.find(params[:id])
    end

    def set_address
      @address = Address.find(caregiver_params[:address_id])
    end

    # Only allow a list of trusted parameters through.
    def caregiver_params
      params.require(:caregiver).permit(:first_name, :last_name, :phone, :email, :address_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to events_url
    end
end
