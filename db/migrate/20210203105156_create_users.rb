class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
