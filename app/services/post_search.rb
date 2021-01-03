# frozen_string_literal: true

class PostSearch
  def self.new(params)
    search = params[:search]
    pquery = Post.where(status: (params[:admin] ? Post::POST_STATUSES : ['public']))
    return pquery unless search.present?

    spct = "%#{search}%"
    ids = ActionTextRichText.where(record_type: 'Post').where('body ilike ?', spct).pluck(:record_id)
    pquery.where('title ilike ?', spct).or(pquery.where(id: ids))
  end
end
