FactoryGirl.define do
  factory :artist do
    name    { Faker::Name.name }
    date_of_birth { Faker::Date.birthday(1,100) }
    nationality { Faker::Lorem.sentence(20) }
  end
end
