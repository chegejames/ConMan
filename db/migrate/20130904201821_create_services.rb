class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :project
      t.string :name
      t.float :lowest_estimated_number_of_services
      t.float :highest_estimated_number_of_services
      t.float :actual_number
      t.float :lowest_estimated_cost_per_service
      t.float :highest_estimated_cost_per_service
      t.float :avg_cost_per_service
      t.float :total_cost

      t.timestamps
    end
    add_index :services, :project_id
  end
end
