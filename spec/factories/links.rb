# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title "Link title"
    url "Link url"
    text "Link text(optional)"
    sub_id "Link's sub"
  end
end
