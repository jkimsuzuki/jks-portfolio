class JournalEntriesController < ApplicationController
  def create
    @entry = JournalEntry.new(entry_params)
    @entry.entry_date = Date.today if @entry.entry_date.blank?
    if @entry.save
      redirect_to journal_path, notice: "Entry added."
    else
      redirect_to journal_path, alert: "Could not save entry."
    end
  end

  def destroy
    @entry = JournalEntry.find(params[:id])
    @entry.destroy
    redirect_to journal_path, notice: "Entry deleted."
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :body, :entry_type, :tags, :entry_date)
  end
end
