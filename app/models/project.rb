class Project < ActiveRecord::Base
  belongs_to :user
  has_many :phases, :dependent => :delete_all
  has_many :materials, :dependent => :delete_all
  has_many :material_procurements, :dependent => :delete_all
  has_many :material_usages, :dependent => :delete_all
  has_many :services, :dependent => :delete_all
  has_many :service_procurements, :dependent => :delete_all
  has_many :labour_estimates, :dependent => :delete_all
  has_many :labourers, :dependent => :delete_all
  has_many :wages, :dependent => :delete_all

  attr_accessible :balance_amount, :budget_amount, :completion_pct, :estimated_completion_date, :location, :name, :spent_amount, :start_date

  validates :name, presence: true
  validates :budget_amount, presence: true, :numericality => true

   #FIXME i want to update on a regular basis
  def calculate_totals_and_balance_and_progress
    material_procurement = self.material_procurements.sum(:total)
    service_procurement = self.service_procurements.sum(:cost)
    wages = self.wages.sum(:cost)
    spent_amount = material_procurement + service_procurement + wages
    balance_amount = self.budget_amount - spent_amount
    avg_completion = self.phases.average(:completion_pct).to_i
    self.update_attributes(:spent_amount => spent_amount, :balance_amount => balance_amount, :completion_pct => avg_completion)
  end
end
