require 'factory_girl'

FactoryGirl.define do
  factory :testresult do
    value {rand(2000)}
    testresult_date Time.now().to_i
    note  'example note for example parameter'
  end
end