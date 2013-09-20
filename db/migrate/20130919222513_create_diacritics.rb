class CreateDiacritics < ActiveRecord::Migration
  def change
    create_table :diacritics do |t|
      t.string :letter
      t.integer :feature_id

      t.timestamps
    end
  end
end
