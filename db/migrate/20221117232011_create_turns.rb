class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.datetime :turn_date
      t.time :hour
      t.string :reason_turn
      t.string :comment
      t.string :state # Pendiente - Atendido - Cancelado
      # sucursal
      t.references :subsidiary, null: false, foreign_key: true
      # doble foreign_key
      t.references :user_client, null: false, foreign_key: { to_table: :users }
      t.references :user_bank, null: true, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
