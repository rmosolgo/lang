class CreateTagsAndTaggings < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :tagged_id
      t.timestamps
    end
  end
end
