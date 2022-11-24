class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    create_table :localities do |t|
      t.string :name_locality
      t.references :province, null: false, foreign_key: true
      t.timestamps
    end
    add_index :localities, [:name_locality, :province_id], unique: true
  end
end
