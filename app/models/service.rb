class Service < ActiveRecord::Base
  belongs_to :project
  has_many :service_procurements
  attr_accessible :actual_number, :avg_cost_per_service, :highest_estimated_cost_per_service, :highest_estimated_number_of_services, :lowest_estimated_cost_per_service, :lowest_estimated_number_of_services, :name, :total_cost

  validates :actual_number, :avg_cost_per_service, :highest_estimated_cost_per_service, :highest_estimated_number_of_services, :lowest_estimated_cost_per_service, :lowest_estimated_number_of_services, :total_cost, numericality: true, allow_nil: true

  validates :name, presence: true

  delegate :name, :to => :phase, :allow_nil => true, :prefix => true

  def calulate_total_and_avg_cost_and_number

      total_services = self.service_procurements.count
      total_cost = self.service_procurements.sum(:cost)
      avg_cost = total_cost/total_services
      if avg_cost.nan?
        avg_cost = 0.0
      end
      self.update_attributes(:actual_number => total_services, :total_cost => total_cost, :avg_cost_per_service => avg_cost)
  end


end
