# frozen_string_literal: true

class Budget < ApplicationRecord
  has_many :accounts, dependent: :destroy

  validates :name, presence: true
end
