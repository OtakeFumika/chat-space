FactoryGirl.define do

  factory :message do
    text           { Faker::Lorem.sentence }
    image          { File.open("#{Rails.root}/test/fixtures/files/the_inu.jpg") }
    user_id        2
    group_id       1
    created_at     { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
