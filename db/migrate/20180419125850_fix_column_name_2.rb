class FixColumnName2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :passport_salt, :password_salt
  end
end
