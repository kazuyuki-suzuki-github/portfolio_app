FactoryBot.define do
  factory :company do
    id {1}
    name {"company name"}
    address {"address"}
    access {"access"}
    info {"info"}
    prefecture_id {1} 
    association :user
  end
end
