FactoryGirl.define do

  factory :customer do
    sequence(:name) { |n|  "Some Customer #{n}" }
    email "some@domain.com"
  end

end
