# frozen_string_literal: true

class Budget < ApplicationRecord
  has_many :accounts, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
