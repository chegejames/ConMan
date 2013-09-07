class LabourEstimate < ActiveRecord::Base
  belongs_to :project
  attr_accessible :actual_number_of_days, :actual_number_of_men, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_number_of_men, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_number_of_men, :lowest_estimated_total_cost
end
