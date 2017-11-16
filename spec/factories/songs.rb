FactoryGirl.define do
  factory :song do
    name      {Faker::Lorem.sentence(50)}
    category  {Faker::Lorem.sentence(50)}
    composer  {Faker::Lorem.sentence(50)}
    artist    { build(:artist) }
  end
end
