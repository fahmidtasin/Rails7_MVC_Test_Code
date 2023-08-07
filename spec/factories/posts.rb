FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    association :user, factory: :user   #Post model has a belongs_to :user association
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'sample_image.jpg'), 'image/jpeg') }
  end
end
