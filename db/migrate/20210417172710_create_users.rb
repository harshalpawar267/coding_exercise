class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.bigint :phone
      t.string :role, default: :developer
      t.timestamps
    end
  end
end
