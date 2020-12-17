require 'rails_helper'

RSpec.describe PlanFeature, type: :model do
  it 'is valid with plans_id, features_id' do
    pf = PlanFeature.new(plans_id:1, features_id:1)
    expect(pf.valid?).to eq(true)
  end

  it 'is invalid without plans_id' do
    pf = PlanFeature.new(plans_id:nil, features_id:1)
    expect(pf.valid?).to eq(false)
  end

  it 'is invalid without features_id' do
    pf = PlanFeature.new(plans_id:1, features_id:nil)
    expect(pf.valid?).to eq(false)
  end
end
