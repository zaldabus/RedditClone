class Sub < ActiveRecord::Base
   attr_accessible :sub_name, :mod_id

   validates :sub_name, :mod_id, presence: true

   belongs_to(:moderator,
     class_name:"User",
     foreign_key: :mod_id,
     primary_key: :id )

   has_many(
   :linksubs,
   class_name: "LinkSub",
   foreign_key: :sub_id,
   primary_key: :id
   )

   has_many(
   :links,
   through: :linksubs,
   source: :link)

end
