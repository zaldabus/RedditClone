class Comment < ActiveRecord::Base
   attr_accessible :body, :parent_comment_id, :link_id, :user_id

   validates :body, :link_id, presence: true

   belongs_to(:user)

   belongs_to(:link)

   belongs_to(:parent,
     :class_name=>"Comment",
     :foreign_key=>:parent_comment_id,
     :primary_key=>:id)

   has_many(:children,
     :class_name=>"Comment",
     :foreign_key=>:parent_comment_id,
     :primary_key=>:id)
end
