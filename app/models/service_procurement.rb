class ServiceProcurement < ActiveRecord::Base
  belongs_to :project
  belongs_to :service
  belongs_to :phase
  attr_accessible :cost, :date, :provider
  delegate :name, :to => :phase, :allow_nil => true, :prefix => true
  after_save :update_service, :update_phase, :update_project
  after_destroy :update_service, :update_phase, :update_project

  def update_service
    self.service.calulate_total_and_avg_cost_and_number
  end

  def update_phase
    if self.phase.present?
      self.phase.calculate_total_cost_for_services
    end
  end

  def update_project
    self.project.calculate_totals_and_balance
  end
end
