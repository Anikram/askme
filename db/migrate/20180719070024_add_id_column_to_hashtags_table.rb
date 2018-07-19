class AddIdColumnToHashtagsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :hashtags, :hashtag_id, :integer
  end
end
