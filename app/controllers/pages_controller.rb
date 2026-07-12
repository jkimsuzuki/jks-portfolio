class PagesController < ApplicationController
  def overview
  end

  def about
  end

  def systems
  end

  def experiments
    @experiments = Experiment.order(experiment_date: :desc, created_at: :desc)
    @new_experiment = Experiment.new
  end

  def journal
    @entries = JournalEntry.order(entry_date: :desc, created_at: :desc)
    @new_entry = JournalEntry.new
  end

  def learnings
  end
end
