class MaterialProcurement < ActiveRecord::Base
  belongs_to :material
  attr_accessible :date, :price_per_unit, :quantity, :total
  before_save :calculate_total
  after_save :calculate_totals_for_material,  :update_phase_avg
  after_destroy :calculate_totals_for_material, :update_phase_avg

  def calculate_total
    self.total = self.quantity * self.price_per_unit
  end

  def calculate_totals_for_material
    self.material.calculate_total_units_and_cost
  end
   #FIXME update the avgs when new material is bought
   def update_phase_avg

  end
end
