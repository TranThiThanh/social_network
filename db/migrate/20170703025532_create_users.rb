class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.datetime :birthday
      t.integer :gender
      t.string :job
      t.string :phone
      t.string :address
      t.string :avatar
      t.string :cover
      t.boolean :isActivity
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
