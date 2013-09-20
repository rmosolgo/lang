class CreateJoinTableDiacriticsSounds < ActiveRecord::Migration
  def change
  def change
   create_join_table :diacritics, :sounds do |t|
      t.index [:diacritic_id, :sound_id]
      t.index [:sound_id, :diacritic_id]
    end
  end
  end
end
