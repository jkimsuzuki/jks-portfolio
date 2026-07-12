class CreateJournalEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.text :body
      t.string :entry_type
      t.string :tags
      t.date :entry_date

      t.timestamps
    end
  end
end
