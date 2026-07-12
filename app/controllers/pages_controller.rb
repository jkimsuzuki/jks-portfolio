class PagesController < ApplicationController
  def overview
    @experiments = Experiment.where(status: "IN PROGRESS").order(created_at: :desc).limit(3)
    @project_count = Experiment.count
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
    @learnings = Learning.order(created_at: :desc)
    @new_learning = Learning.new
  end
end
