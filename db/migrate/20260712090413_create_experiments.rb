class CreateExperiments < ActiveRecord::Migration[8.1]
  def change
    create_table :experiments do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :url
      t.date :experiment_date

      t.timestamps
    end
  end
end
