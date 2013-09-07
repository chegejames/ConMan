class Phase < ActiveRecord::Base
  belongs_to :project
  has_many :material_usages
  has_many :service_procurements
  attr_accessible :actual_completion_date, :actual_cost, :actual_start_date, :completion_pct, :estimated_completion_date, :estimated_start_date, :highest_estimated_cost, :lowest_estimated_cost, :name

  TotalAmountArray = []
  #FIXME find  a way to update phase simultaniously
  def calculate_avg_cost
    TotalAmountArray.clear
    values_hash = self.material_usages.group("material_id").select("material_id").sum("quantity")
    values_hash.each do |id, total_units|
      TotalAmountArray <<  Material.find(id).average_cost_per_unit * total_units
    end
    avg_cost = TotalAmountArray.sum
    self.update_attributes(:actual_cost => avg_cost)
  end

  def calculate_total_cost_for_services
    total_cost = self.service_procurements.sum(:cost)
    self.update_attributes(:actual_cost => total_cost)
  end

  def calculate_total_cost_for_wages
    total_cost = self.wages.sum(:cost)
    self.update_attributes(:actual_cost => total_cost)
  end
end
