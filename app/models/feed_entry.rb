class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url, :custom_fields

  serialize :custom_fields

  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id

        main_methods = %w(@title @summary @url @published @entry_id)
        custom_fields = entry.instance_variables.
            delete_if{|item| main_methods.include?(item.to_s)}.
            inject({}){|memo, obj| memo ||={}; memo.merge!({obj => entry.send(obj.to_s.gsub("@","")).to_s})}

        create!(
            :name           => entry.title,
            :summary        => entry.summary,
            :url            => entry.url,
            :published_at   => entry.published,
            :guid           => entry.id,
            :custom_fields  => custom_fields
        )
      end
    end
  end

end
