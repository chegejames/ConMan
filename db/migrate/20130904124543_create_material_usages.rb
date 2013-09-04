class CreateMaterialUsages < ActiveRecord::Migration
  def change
    create_table :material_usages do |t|
      t.references :project
      t.references :material
      t.date :date
      t.float :quantity
      t.references :phase
      t.text :description

      t.timestamps
    end
    add_index :material_usages, :project_id
    add_index :material_usages, :material_id
    add_index :material_usages, :phase_id
  end
end
