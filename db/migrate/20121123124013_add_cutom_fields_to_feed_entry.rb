class AddCutomFieldsToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :custom_fields, :text
  end
end
