class AddFeatureTypeToFeature < ActiveRecord::Migration
  def change
    add_column :features, :feature_type, :string
  end
end
