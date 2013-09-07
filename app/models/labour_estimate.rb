class LabourEstimate < ActiveRecord::Base
  belongs_to :project
  attr_accessible :no_of_days, :no_of_men, :total_cost, :total_cost_per_day
end
