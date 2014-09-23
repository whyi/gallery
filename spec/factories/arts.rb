FactoryGirl.define do
  factory :art do
    title "test title"
    description "test description"
    category_cd 1
    width 10
    height 10
    filename "foo.jpg"
    medium "oil on canvas"
    year 2014
  end
end
