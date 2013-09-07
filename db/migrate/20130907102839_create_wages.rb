class CreateWages < ActiveRecord::Migration
  def change
    create_table :wages do |t|
      t.references :project
      t.references :labourer
      t.references :phase
      t.text :job
      t.date :date
      t.float :cost

      t.timestamps
    end
    add_index :wages, :project_id
    add_index :wages, :labourer_id
    add_index :wages, :phase_id
  end
end
