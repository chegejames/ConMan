class CreateServiceProcurements < ActiveRecord::Migration
  def change
    create_table :service_procurements do |t|
      t.references :project
      t.references :service
      t.references :phase
      t.string :provider
      t.date :date
      t.float :cost

      t.timestamps
    end
    add_index :service_procurements, :project_id
    add_index :service_procurements, :service_id
    add_index :service_procurements, :phase_id
  end
end
