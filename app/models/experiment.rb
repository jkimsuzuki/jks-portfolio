class Experiment < ApplicationRecord
  validates :name, presence: true
  validates :status, inclusion: { in: %w[COMPLETE IN\ PROGRESS IDEA ON\ HOLD] }
end
