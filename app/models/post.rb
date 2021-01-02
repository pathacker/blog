# frozen_string_literal: true

class Post < ApplicationRecord
  POST_STATUSES = %w[private public archived].freeze
  has_rich_text :body
  validates :title, presence: true, length: { maximum: 128 }
  # validates :body, presence: true
  # validates :status, presence: true, inclusion: {in: POST_STATUSES}

  def public?
    status == 'public'
  end

  def self.query(params)
    search = params[:search]
    pquery = where(status: (params[:admin] ? POST_STATUSES : ['public']))
    return pquery unless search.present?

    spct = "%#{search}%"
    ids = ActionTextRichText.where(record_type: 'Post').where('body ilike ?', spct).pluck(:record_id)
    pquery.where('title ilike ?', spct).or(pquery.where(id: ids))
  end
end
