class Link < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to(:sub,
  class_name: "Sub",
  foreign_key: :sub_id,
  primary_key: :id)
end
