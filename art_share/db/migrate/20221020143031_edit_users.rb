class EditUsers < ActiveRecord::Migration[7.0]
  def change
      remove_column :users, :email
      rename_column :users, :name, :username
      change_column :users, :username, :string, unique: true
  end
end
