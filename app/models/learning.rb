class Learning < ApplicationRecord
  validates :name, presence: true
  validates :resource_type, inclusion: { in: %w[COURSE DOCUMENTATION VIDEO ARTICLE BOOK NOTE] }
  validates :progress, numericality: { in: 0..100 }, allow_nil: true

  def complete?
    progress == 100
  end
end
