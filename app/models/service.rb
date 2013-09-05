class Service < ActiveRecord::Base
  belongs_to :project
  has_many :service_procurements
  attr_accessible :actual_number, :avg_cost_per_service, :highest_estimated_cost_per_service, :highest_estimated_number_of_services, :lowest_estimated_cost_per_service, :lowest_estimated_number_of_services, :name, :total_cost

  def calulate_total_and_avg_cost_and_number
    total_services = self.service_procurements.count
    total_cost = self.service_procurements.sum(:cost)
    avg_cost = total_cost/total_services
    self.update_attributes!(:actual_number => total_services, :total_cost => total_cost, :avg_cost_per_service => avg_cost)
  end


end