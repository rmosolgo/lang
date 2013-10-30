class CreateLanguageMetricValues < ActiveRecord::Migration
  def change
    create_table :language_metric_values do |t|
      t.integer :language_id
      t.integer :language_metric_id
      t.float :value

      t.timestamps
    end
  end
end
