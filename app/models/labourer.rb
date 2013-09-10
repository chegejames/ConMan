class Labourer < ActiveRecord::Base
  belongs_to :project
  has_many :wages, dependent: :delete_all
  attr_accessible :actual_number_of_days, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_total_cost, :name, :title

  validates  :actual_number_of_days, :actual_total_cost, :avg_cost_per_day, :highest_estimated_cost_per_day, :highest_estimated_number_of_days, :highest_estimated_total_cost, :lowest_estimated_cost_per_day, :lowest_estimated_number_of_days, :lowest_estimated_total_cost, numericality: true, allow_nil: true
  validates :name, presence: true

  def calculate_total_wages
    total_days = self.wages.group("date").select("date").count.count
    total_wages = self.wages.sum(:cost)
    avg_cost = total_wages/total_days
    if avg_cost.nan?
      avg_cost = 0
    end
    self.update_attributes(:actual_total_cost => total_wages, :avg_cost_per_day => avg_cost, :actual_number_of_days => total_days)
  end

end
