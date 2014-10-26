FactoryGirl.define do
  factory :art do
    title "test title"
    description "test description"
    category_cd 1
    width 10
    height 10
    filename Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/caitlyn.png')))
    #filename ActionDispatch::Http::UploadedFile.new(:tempfile => "#{Rails.root}/spec/fixtures/caitlyn.png", :filename => "caitlyn.png")
    medium "oil on canvas"
    year 2014
    user_id 1
  end
end

