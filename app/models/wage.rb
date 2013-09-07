class Wage < ActiveRecord::Base
  belongs_to :project
  belongs_to :labourer
  belongs_to :phase
  attr_accessible :cost, :date, :job

  delegate :name, :to => :phase, :allow_nil => true, :prefix => true

  after_save :update_labourer_total_wages
  after_destroy :update_labourer_total_wages

  def update_labourer_total_wages
    self.labourer.calculate_total_wages
  end

  def update_phase_total_cost
    if self.phase.present?
      self.phase.calculate_total_cost_for_wages
    end
  end
end
