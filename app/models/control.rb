class Control < ApplicationRecord
  before_save {self.name = name.upcase}
  before_save {self.lot = lot.upcase}
end
