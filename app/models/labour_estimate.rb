class LabourEstimate < ActiveRecord::Base
  belongs_to :project
  attr_accessible :actual_number_of_days, :actual_number_of_men, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_number_of_men, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_number_of_men, :lowest_estimated_total_cost

  validates :actual_number_of_days, :actual_number_of_men, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_number_of_men, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_number_of_men, :lowest_estimated_total_cost, numericality: true, allow_nil: true

  def calculate_total_cost_and_total_days
    if self.project.wages.empty?
      self.update_attributes(:actual_number_of_days => 0, :actual_number_of_men => 0,  :actual_total_cost => 0, :avg_cost_per_day => 0)
    else
      total_cost = self.project.wages.sum(:cost)
      total_men = self.project.labourers.count
      total_days = self.project.wages.group("date").select("date").count.count
      avg_cost = total_cost/total_days
      self.update_attributes(:actual_number_of_days => total_days, :actual_number_of_men => total_men,  :actual_total_cost => total_cost, :avg_cost_per_day => avg_cost)
      end

  end
end
