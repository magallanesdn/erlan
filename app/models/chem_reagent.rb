class ChemReagent < ApplicationRecord
  before_save {self.reagent = reagent.upcase}
  before_save {self.lot = lot.upcase}
  
  validates :reagent, presence: true
  validates :lot, presence: true
  validates :start, presence: true
  validates :expiration, presence: true
  validates :flex, presence: true
  validates :box, presence: true
end