class ControlsController < ApplicationController
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
    @control = Control.find(params[:id])
  end
  
  private
  
  def control_params
    params.require(:control).permit(:name, :lot, :start, :expiration)
  end
end