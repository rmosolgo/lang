class CreateFeatureSounds < ActiveRecord::Migration
  def change
    create_table :feature_sounds do |t|
      t.integer :feature_id
      t.integer :sound_id

      t.timestamps
    end
  end
end
