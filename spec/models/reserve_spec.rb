require 'rails_helper'

RSpec.describe Reserve, type: :model do
  
  it "is valid with user_id, company_id, plan_id" do
    reserve = FactoryBot.build(:reserve)
    expect(reserve).to be_valid
  end

  it "is invalid without user_id" do
    reserve = FactoryBot.build(:reserve, user_id: nil)
    reserve.valid?
    expect(reserve.errors[:user_id]).to include("を入力してください")
  end

  it "is invalid without company_id" do
    reserve = FactoryBot.build(:reserve, company_id: nil)
    reserve.valid?
    expect(reserve.errors[:company_id]).to include("を入力してください")
  end

  it "is invalid without plan_id" do
    reserve = FactoryBot.build(:reserve, plan_id: nil)
    reserve.valid?
    expect(reserve.errors[:plan_id]).to include("を入力してください")
  end

end
