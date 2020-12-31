# frozen_string_literal: true

class Post < ApplicationRecord
  POST_STATUSES = %w[private public archived].freeze
  has_rich_text :body
  # validates :title, presence: true, length: {maximum: 128}
  # validates :body, presence: true
  # validates :status, presence: true, inclusion: {in: POST_STATUSES}
end
