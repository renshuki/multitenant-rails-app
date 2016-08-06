FactoryGirl.define do
  factory :user do
    name 'Renshuki'
    sequence(:email) { |n| "email#{n}@foo.bar"}
    password 'pw'
  end

end
