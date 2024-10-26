FactoryBot.define do
    factory :list do
        title {Faker::Lorem.characters(number:5)}
        body {Faker::Lorem.characters(number:20)}
        after(:build) do |list|
            list.images.attach(io: File.open('spec/fixtures/sample_s.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
        end
    end
end