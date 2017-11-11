FactoryGirl.define do
  factory :photo do
    image    {Faker::Lorem.sentence(50)}
    artist   { build(:artist) }
  end
end
