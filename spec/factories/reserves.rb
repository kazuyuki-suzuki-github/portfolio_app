FactoryBot.define do
  factory :reserve do
    user_id {1}
    company_id {1}
    plan_id {1}
    association :plan
    association :company
  end
end
