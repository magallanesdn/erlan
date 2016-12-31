class Control < ApplicationRecord
  before_save {self.name = name.upcase}
  before_save {self.lot = lot.upcase}
  
  validates :name, presence: true
  validates :item, presence: true
  validates :lot, presence: true
  validates :start, presence: true
  validates :expiration, presence: true
  validates :stock, presence: true
end
