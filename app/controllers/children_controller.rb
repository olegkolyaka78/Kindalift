class ChildrenController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_child, only: %i[ show edit update destroy ]
  before_action :set_address, only: [ :update, :create ]

  # GET /children or /children.json
  def index
    @children = Child.all
  end

  # GET /children/1 or /children/1.json
  def show
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children or /children.json
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to child_url(@child), notice: "Child was successfully created." }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1 or /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to child_url(@child), notice: "Child was successfully updated." }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1 or /children/1.json
  def destroy
    @child.destroy

    respond_to do |format|
      format.html { redirect_to children_url, notice: "Child was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    def set_address
      @address = Address.find(child_params[:address_id])
    end

    # Only allow a list of trusted parameters through.
    def child_params
      params.require(:child).permit(:first_name, :last_name, :phone, :address_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to events_url
    end
    
end
