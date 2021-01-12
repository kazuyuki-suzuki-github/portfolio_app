FactoryBot.define do
  factory :search do
    prefecture_id {1}
    checkin {(Date.today+1).strftime()}
    checkout {(Date.today+2).strftime()}
    people {1}
  end
end
