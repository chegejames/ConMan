class CreateLabourEstimates < ActiveRecord::Migration
  def change
    create_table :labour_estimates do |t|
      t.references :project
      t.integer :no_of_men
      t.float :no_of_days
      t.float :total_cost_per_day
      t.float :total_cost

      t.timestamps
    end
    add_index :labour_estimates, :project_id
  end
end
