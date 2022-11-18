class CreateSubsidiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :subsidiaries do |t|
      t.string :address
      t.string :phone
      t.references :locality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
