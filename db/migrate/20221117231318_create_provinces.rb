class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :name_province, index: { unique: true }
      t.timestamps
    end
  end
end
