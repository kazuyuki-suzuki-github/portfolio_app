FactoryBot.define do
  factory :plan do
    id {1}
    name {"plan name"}
    check_in {Time.now}
    check_out {Time.now}
    stock {100}
    price {10000}
    sale_from {(Date.today+1).strftime()}
    sale_to {(Date.today+2).strftime()}
    room_type {1}
    association :company
  end
end
