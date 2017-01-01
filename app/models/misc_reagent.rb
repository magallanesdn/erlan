class MiscReagent < ApplicationRecord
  before_save {self.kit = kit.capitalize}
  before_save {self.lot = lot.upcase}
end