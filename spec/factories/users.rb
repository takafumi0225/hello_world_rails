FactoryBot.define do
  factory :user do
    _account = Faker::Internet.username

    name{ Faker::Name.name }
    sequence(:account) { |n| "#{n}_#{Faker::Internet.username}" }
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }

    trait :with_user_detail do
      # association :user_detail, factory: :user_detail の省略形
      user_detail
    end
  end
end
