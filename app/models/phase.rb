class Phase < ActiveRecord::Base
  belongs_to :project
  has_many :material_usages, :dependent => :nullify
  has_many :service_procurements, :dependent => :nullify
  has_many :wages, :dependent => :nullify

  attr_accessible :actual_completion_date, :actual_cost, :actual_start_date, :completion_pct, :estimated_completion_date, :estimated_start_date, :highest_estimated_cost, :lowest_estimated_cost, :name

  validates :name, presence: true
  validates :completion_pct , :highest_estimated_cost, :lowest_estimated_cost, numericality: true, :allow_nil => true

  after_save :update_project
  after_destroy :update_project
  TotalAmountArray = []
  #FIXME i want to update on a regular basis
  def update_total_cost
    TotalAmountArray.clear
    values_hash = self.material_usages.group("material_id").select("material_id").sum("quantity")
    values_hash.each do |id, total_units|
      TotalAmountArray <<  Material.find(id).average_cost_per_unit * total_units
    end
    total_cost = self.service_procurements.sum(:cost) + TotalAmountArray.sum + self.wages.sum(:cost)
    self.update_attributes(:actual_cost => total_cost)
  end

  def update_project
    self.project.calculate_totals_and_balance_and_progress
  end
end
