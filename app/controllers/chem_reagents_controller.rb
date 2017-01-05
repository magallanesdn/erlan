class ChemReagentsController < ApplicationController
  def index
    @chem_reagents = ChemReagent.all
  end
  
  def new
    @chem_reagent = ChemReagent.new
  end
  
  def create
    @chem_reagent = ChemReagent.new(chem_reagent_params)
    if  @chem_reagent.save
      flash[:notice] = "Reagent Saved"
      redirect_to @chem_reagent
    else
      flash.now[:alert] = "Reagent failed to saved"
      render 'new'
    end
  end
  
  def destroy
    @chem_reagent = ChemReagent.find(params[:id])
    if @chem_reagent.destroy
      flash[:notice] = "Reagent has been deleted"
      redirect_to chem_reagents_path
    end
  end
  
  def edit
    @chem_reagent = ChemReagent.find(params[:id])
  end
  
  def update
    @chem_reagent = ChemReagent.find(params[:id])
    if @chem_reagent.update(chem_reagent_params)
       flash[:notice] = "Reagents updated"
       redirect_to chem_reagents_path
    else
       flash.now[:alert] = "Failed to update reagent"
       render :edit
    end
  end
  
  def show
    @chem_reagent = ChemReagent.find(params[:id])
  end
  
  private
  def chem_reagent_params
    params.require(:chem_reagent).permit(:reagent, :lot, :start, :expiration, :flex, :box)
  end
end