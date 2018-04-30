class AddDefaultValueToBgcolor < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :bgcolor, :string, :default => "#005a55"
  end
end
