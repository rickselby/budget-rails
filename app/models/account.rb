# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :budget

  validates :name, presence: true
end
