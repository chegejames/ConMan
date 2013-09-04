class CreateMaterialProcurements < ActiveRecord::Migration
  def change
    create_table :material_procurements do |t|
      t.references :project
      t.references :material
      t.date :date
      t.float :quantity
      t.float :price_per_unit
      t.float :total

      t.timestamps
    end
    add_index :material_procurements, :material_id
  end
end
