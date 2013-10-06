class CreatePhonemes < ActiveRecord::Migration
  def change
    create_table :phonemes do |t|
      t.integer :sound_id
      t.integer :language_id

      t.timestamps
    end
  end
end
