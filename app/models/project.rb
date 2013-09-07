class Project < ActiveRecord::Base
  belongs_to :user
  has_many :phases
  has_many :materials
  has_many :material_procurements
  has_many :material_usages
  has_many :services
  has_many :service_procurements
  has_many :labour_estimates
  #FIXME add currency to project and format numbers
  attr_accessible :balance_amount, :budget_amount, :completion_pct, :estimated_completion_date, :location, :name, :spent_amount, :start_date

  def calculate_totals_and_balance
    material_procurement = self.material_procurements.sum(:total)
    service_procurement = self.service_procurements.sum(:cost)
    spent_amount = material_procurement + service_procurement
    balance_amount = self.budget_amount - spent_amount
    self.update_attributes(:spent_amount => spent_amount, :balance_amount => balance_amount)
  end
end
