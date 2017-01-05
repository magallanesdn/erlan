class DashboardsController < ApplicationController
  def index
    @chem_reagents = ChemReagent.all
    @controls = Control.all
    @misc_reagents = MiscReagent.all
  end
end