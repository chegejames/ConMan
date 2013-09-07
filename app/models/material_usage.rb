class MaterialUsage < ActiveRecord::Base
  belongs_to :project
  belongs_to :material
  belongs_to :phase
  attr_accessible :date, :description, :quantity
  delegate :name, :to => :phase, :allow_nil => true, :prefix => true

  after_save :update_material_used, :update_phase_avg
  after_destroy :update_material_used, :update_phase_avg

  def update_material_used
    self.material.calculate_total_units_and_cost
  end

  def update_phase_avg
    if self.phase.present?
      self.phase.calculate_avg_cost
    end
  end
end
