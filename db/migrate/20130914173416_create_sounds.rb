class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :letter

      t.timestamps
    end
  end
end
