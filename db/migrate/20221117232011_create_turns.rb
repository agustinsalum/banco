class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.datetime :turn_date
      t.string :day_week
      t.time :hour
      t.string :reason_turn
      t.string :comment
      t.references :subsidiary, null: false, foreign_key: true
      t.string :state
       # doble foreign_key
       t.references :user_client, null: false, foreign_key: { to_table: :users }
       t.references :user_bank, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
