class Labourer < ActiveRecord::Base
  belongs_to :project
  has_many :wages
  attr_accessible :actual_number_of_days, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_total_cost, :name, :title

  def calculate_total_wages
    total_wages = self.wages.sum(:cost)
    self.update_attributes(:actual_total_cost => total_wages)
  end

end
