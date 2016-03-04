class Entry < ActiveRecord::Base
  def self.select_randomly(num = 1)
    ids = self.select(:id).where(is_disabled: false)
    self.where(id: ids.sample(num))
  end
end
