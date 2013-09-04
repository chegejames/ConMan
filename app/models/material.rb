class Material < ActiveRecord::Base
  belongs_to :project
  has_many :material_procurements
  has_many :material_usages
  attr_accessible :actual_units, :average_cost_per_unit, :balance_units, :highest_estimated_cost_per_unit, :highest_estimated_units, :lowest_estimated_cost_per_unit, :lowest_estimated_units, :name, :units_of_measurement, :total_cost

  def calculate_total_units_and_cost
    total_cost = self.material_procurements.sum(:total)
    total_units = self.material_procurements.sum(:quantity)
    #FIXME find correct formula for avg
    #avg_price_per_unit = self.material_procurements.average(:price_per_unit).to_f
    avg_price_per_unit = total_cost/total_units
    total_left = total_units - self.material_usages.sum(:quantity)
    self.update_attributes(:actual_units =>  total_units, :total_cost => total_cost, :average_cost_per_unit => avg_price_per_unit, :balance_units => total_left)
  end
end
