class AddContentToPost < ActiveRecord::Migration
  def change
      add_column :posts, :file, :text
  end
end
