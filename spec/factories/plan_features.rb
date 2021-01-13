FactoryBot.define do
  factory :plan_feature do
    plans_id {1}
    feature_id {1}
    association :feature
  end
end
