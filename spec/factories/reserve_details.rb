FactoryBot.define do
  factory :reserve_detail do
    check_in {Time.now}
    check_out {Time.now}
    people {1}
    reserve_id {1}
  end
end
