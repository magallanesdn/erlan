class ControlsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_control, only: [:show, :edit, :update, :destroy]
  def index
    @controls = Control.all
  end
  
  def new
    @control = Control.new
  end
  
  def create
    @control = Control.new(control_params)
      if @control.save
        flash[:notice] = "Control Saved"
        redirect_to @control
      else
        flash.now[:alert] = "Control failed to saved"
        render :new
      end 
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
     
     if @control.update(control_params)
       flash[:notice] = "Controls updated"
       redirect_to controls_path
     else
       flash.now[:alert] = "Failed to update control"
       render :edit
     end
  end
  
  def destroy
    @control = Control.find(params[:id])
    if @control.destroy
      flash[:notice] = "Control has been deleted"
      redirect_to controls_path
    end
  end
  
  private
  
  def set_control
    @control = Control.find(params[:id])
  end
  
  def control_params
    params.require(:control).permit(:name, :lot, :start, :expiration, :item)
  end
end