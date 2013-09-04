class Project < ActiveRecord::Base
  belongs_to :user
  has_many :phases
  has_many :materials
  has_many :material_procurements
  has_many :material_usages
  #FIXME add currency to project and format numbers
  attr_accessible :balance_amount, :budget_amount, :completion_pct, :estimated_completion_date, :location, :name, :spent_amount, :start_date
end
