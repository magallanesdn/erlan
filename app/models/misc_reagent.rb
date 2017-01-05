class MiscReagent < ApplicationRecord
  before_save {self.kit = kit.capitalize}
  before_save {self.lot = lot.upcase}
  
  validates :kit, presence: true
  validates :lot, presence: true
  validates :start, presence: true
  validates :expiration, presence: true
  validates :test_left, presence: true
  validates :box, presence: true
  
  default_scope { order(kit: :asc) }
end