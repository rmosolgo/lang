class CreateJoinTableFeatureSound < ActiveRecord::Migration
  def change
   create_join_table :features, :sounds do |t|
      t.index [:feature_id, :sound_id]
      t.index [:sound_id, :feature_id]
    end
  end
end
