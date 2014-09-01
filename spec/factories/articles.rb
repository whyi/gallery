FactoryGirl.define do
  factory :article do
    title "test_title"
    description "test_description"
    category_cd 1
    width 10
    height 10
    filename "foo.jpg"
  end
end
