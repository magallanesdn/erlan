class MiscReagentsController < ApplicationController
  def index
    @misc_reagents = MiscReagent.all
  end
  
  def new
    @misc_reagent = MiscReagent.new
  end

  def create
    @misc_reagent = MiscReagent.new(misc_reagent_params)
    if  @misc_reagent.save
      flash[:notice] = "Miscellaneous Reagent Saved"
      redirect_to @misc_reagent
    else
      flash.now[:alert] = "Failed to saved"
      render 'new'
    end
  end
  
  def show
    @misc_reagent = MiscReagent.find(params[:id])
  end
  
  def destroy
    @misc_reagent = MiscReagent.find(params[:id])
    if @misc_reagent.destroy
      flash[:notice] = "Reagent has been deleted"
      redirect_to misc_reagents_path
    end
  end
  
  def edit
    @misc_reagent = MiscReagent.find(params[:id])
  end
  
  def update
    @misc_reagent = MiscReagent.find(params[:id])
    if @misc_reagent.update(misc_reagent_params)
       flash[:notice] = "Reagents updated"
       redirect_to misc_reagents_path
    else
       flash.now[:alert] = "Failed to update reagent"
       render :edit
    end
  end
  
  private
  
  def misc_reagent_params
    params.require(:misc_reagent).permit(:kit, :lot, :start, :expiration, :test_left, :box)
  end
end