class AddNameAndRoleAndLocalityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer , default: 3
    add_reference :users, :subsidiary, null: true, foreign_key: true
  end
end
