require 'rails_helper'

RSpec.describe PlanFeature, type: :model do
  
  it "is valid with plans_id, feature_id" do
    planFeature = FactoryBot.build(:plan_feature)
    expect(planFeature).to be_valid
  end

  it "is invalid without plans_id" do
    planFeature = FactoryBot.build(:plan_feature, plans_id: nil)
    planFeature.valid?
    expect(planFeature.errors[:plans_id]).to include("を入力してください")
  end

  it "is invalid without feature_id" do
    planFeature = FactoryBot.build(:plan_feature, feature_id: nil)
    planFeature.valid?
    expect(planFeature.errors[:feature_id]).to include("を入力してください")
  end
end
