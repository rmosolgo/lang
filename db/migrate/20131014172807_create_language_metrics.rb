class CreateLanguageMetrics < ActiveRecord::Migration
  def change
    create_table :language_metrics do |t|
      t.string :name
      t.float :max
      t.float :min
      t.float :mean
      t.float :median
      t.text :description

      t.timestamps
    end
  end
end
