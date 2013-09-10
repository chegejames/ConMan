class MaterialUsage < ActiveRecord::Base
  belongs_to :project
  belongs_to :material
  belongs_to :phase
  attr_accessible :date, :description, :quantity
  delegate :name, :to => :phase, :allow_nil => true, :prefix => true

  validates :date, :quantity, :material_id, presence: true
  validates :quantity, numericality: true

  after_save :update_material_used, :update_phase
  after_destroy :update_material_used, :update_phase

  def update_material_used
    if self.material.present?
      self.material.calculate_total_units_and_cost
    end
  end

  def update_phase
    if self.phase.present?
      self.phase.update_total_cost
    end
  end
end
