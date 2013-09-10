class ServiceProcurement < ActiveRecord::Base
  belongs_to :project
  belongs_to :service
  belongs_to :phase
  attr_accessible :cost, :date, :provider

  validates :service_id, :cost, :date, :provider, presence: true
  validates :cost, numericality: true
  delegate :name, :to => :phase, :allow_nil => true, :prefix => true
  after_save :update_service, :update_phase
  after_destroy :update_service, :update_phase

  def update_service
    self.service.calulate_total_and_avg_cost_and_number
  end

  def update_phase
    if self.phase.present?
      self.phase.update_total_cost
    end
  end


end
