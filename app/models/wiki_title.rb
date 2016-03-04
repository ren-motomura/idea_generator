class WikiTitle < ActiveRecord::Base
  def self.select_randomly(num = 1)
    @enable_ids ||= self.select(:id).where(is_disabled: false)
    self.where(id: @enable_ids.sample(num))
  end

  def self.remove_from_enable_ids(id)
    @enable_ids.reject! {|enable_id| enable_id == id}
  end

  def disable!
    self.class.remove_from_enable_ids(self.id)
    self.is_disabled = true
    self.save!
  end
end
