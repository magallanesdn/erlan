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
  
  private
  def chem_reagent_params
    params.require(:chem_reagent).permit(:reagent, :lot, :start, :expiration, :flex, :box)
  end
end