class AddTaggedTypeToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :tagged_type, :string
  end
end
