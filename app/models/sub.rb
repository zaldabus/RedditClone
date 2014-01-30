class Sub < ActiveRecord::Base
   attr_accessible :sub_name, :mod_id

   validates :sub_name, :mod_id, presence: true

   belongs_to(:moderator,
     class_name:"User",
     foreign_key: :mod_id,
     primary_key: :id)

   has_many(:links,
   class_name: "Link",
   foreign_key: :sub_id,
   primary_key: :id)
end
