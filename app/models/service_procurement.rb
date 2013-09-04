class ServiceProcurement < ActiveRecord::Base
  belongs_to :project
  belongs_to :service
  belongs_to :phase
  attr_accessible :cost, :date, :provider

  after_save :update_service, :update_phase, :update_project
  after_destroy :update_service, :update_phase, :update_project

  def update_service
    self.service.calulate_total_and_avg_cost_and_number
  end

  def update_phase
    self.phase.calculate_total_cost_for_services
  end

  def update_project
    self.project.calculate_totals_and_balance
  end
end
