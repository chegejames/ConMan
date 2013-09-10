class Material < ActiveRecord::Base
  belongs_to :project
  has_many :material_procurements, :dependent => :destroy
  has_many :material_usages, :dependent => :destroy
  attr_accessible :actual_units, :average_cost_per_unit, :balance_units, :highest_estimated_cost_per_unit, :highest_estimated_units, :lowest_estimated_cost_per_unit, :lowest_estimated_units, :name, :units_of_measurement, :total_cost

  validates :name, :units_of_measurement, presence: true
  validates :average_cost_per_unit, :balance_units, :highest_estimated_cost_per_unit, :highest_estimated_units, :lowest_estimated_cost_per_unit, :lowest_estimated_units, numericality: true, allow_nil: true

  def calculate_total_units_and_cost
      total_cost = self.material_procurements.sum(:total)
      total_units = self.material_procurements.sum(:quantity)
      avg_price_per_unit = total_cost/total_units
      if avg_price_per_unit.nan?
        avg_price_per_unit = 0
      end
      total_left = total_units - self.material_usages.sum(:quantity)
      self.update_attributes(:actual_units =>  total_units, :total_cost => total_cost, :average_cost_per_unit => avg_price_per_unit, :balance_units => total_left)
  end
end
