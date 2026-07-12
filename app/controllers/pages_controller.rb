class PagesController < ApplicationController
  def overview
  end

  def about
  end

  def systems
  end

  def experiments
  end

  def journal
    @entries = JournalEntry.order(entry_date: :desc, created_at: :desc)
    @new_entry = JournalEntry.new
  end

  def learnings
  end
end
