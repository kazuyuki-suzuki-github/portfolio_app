require 'rails_helper'

RSpec.describe Reserve, type: :model do
  it 'is valid with user_id, company_id, plan_id' do
    r = Reserve.new(user_id:1, company_id:1, plan_id:1)
    expect(r.valid?).to eq(true)
  end

  it 'is invalid without user_id' do
    r = Reserve.new(user_id:nil, company_id:1, plan_id:1)
    expect(r.valid?).to eq(false)
  end

  it 'is invalid without company_id' do
    r = Reserve.new(user_id:1, company_id:nil, plan_id:1)
    expect(r.valid?).to eq(false)
  end

  it 'is invalid without plan_id' do
    r = Reserve.new(user_id:1, company_id:1, plan_id:nil)
    expect(r.valid?).to eq(false)
  end
end
