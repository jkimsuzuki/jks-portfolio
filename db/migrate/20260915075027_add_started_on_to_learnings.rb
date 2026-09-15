class AddStartedOnToLearnings < ActiveRecord::Migration[8.1]
  def change
    add_column :learnings, :started_on, :date
  end
end
