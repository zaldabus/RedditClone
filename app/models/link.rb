class Link < ActiveRecord::Base
  attr_accessible :title, :url, :text, :sub_id

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

end
