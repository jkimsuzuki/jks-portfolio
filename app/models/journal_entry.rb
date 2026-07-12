class JournalEntry < ApplicationRecord
  validates :title, presence: true
  validates :entry_type, inclusion: { in: %w[REFLECTION IDEA PLAN LESSON NOTE] }

  def tag_list
    tags.to_s.split(",").map(&:strip)
  end
end
