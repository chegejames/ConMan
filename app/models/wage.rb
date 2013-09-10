class Wage < ActiveRecord::Base
  belongs_to :project
  belongs_to :labourer
  belongs_to :phase
  attr_accessible :cost, :date, :job

  validates :labourer, :cost, :date, presence: true
  validates :cost, numericality: true

  delegate :name, :to => :phase, :allow_nil => true, :prefix => true

  after_save :update_labourer_total_wages, :update_phase, :update_labour_estimates
  after_destroy :update_labourer_total_wages, :update_phase, :update_labour_estimates

  def update_labourer_total_wages
    if self.labourer.present?
      self.labourer.calculate_total_wages
    end
  end

  def update_phase
    if self.phase.present?
      self.phase.update_total_cost
    end
  end

  def update_labour_estimates
    if self.project.labour_estimates.present?
      self.project.labour_estimates.last.calculate_total_cost_and_total_days
    end
  end
end
