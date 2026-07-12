class CreateLearnings < ActiveRecord::Migration[8.1]
  def change
    create_table :learnings do |t|
      t.string :name
      t.string :resource_type
      t.string :topic
      t.text :description
      t.string :url
      t.integer :progress

      t.timestamps
    end
  end
end
