class Link < ActiveRecord::Base
  attr_accessible :title, :url, :text, :sub_ids, :user_id

  validates :title, :url, presence: true

  has_many(
  :linksubs,
  class_name: "LinkSub",
  foreign_key: :link_id,
  primary_key: :id)

  has_many(
  :subs,
  through: :linksubs,
  source: :sub)

  belongs_to(:user)

  has_many(:comments)

  def comments_by_parent_id
    comments_hash = Hash.new { |hash, key| hash[key] = [] }
    all_comments = self.comments

    all_comments.each do |comment|
      comments_hash[comment.parent_comment_id] << comment
    end
    comments_hash
  end

end

