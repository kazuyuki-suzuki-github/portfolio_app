require 'rails_helper'

RSpec.describe Plan, type: :model do
  
  it "is valid with name, check_in, check_out, stock, price, sale_from, sale_to, room_type" do
    plan = FactoryBot.build(:plan)
    expect(plan).to be_valid
  end

  it "is invalid without name" do
    plan = FactoryBot.build(:plan, name: nil)
    plan.valid?
    expect(plan.errors[:name]).to include("を入力してください")
  end

  it "is invalid without check_in" do
    plan = FactoryBot.build(:plan, check_in: nil)
    plan.valid?
    expect(plan.errors[:check_in]).to include("を入力してください")
  end

  it "is invalid without check_out" do
    plan = FactoryBot.build(:plan, check_out: nil)
    plan.valid?
    expect(plan.errors[:check_out]).to include("を入力してください")
  end

  it "is invalid without stock" do
    plan = FactoryBot.build(:plan, stock: nil)
    plan.valid?
    expect(plan.errors[:stock]).to include("を入力してください")
  end

  it "is invalid without price" do
    plan = FactoryBot.build(:plan, price: nil)
    plan.valid?
    expect(plan.errors[:price]).to include("を入力してください")
  end

  it "is invalid without sale_from" do
    plan = FactoryBot.build(:plan, sale_from: nil)
    plan.valid?
    expect(plan.errors[:sale_from]).to include("を入力してください")
  end

  it "is invalid without sale_to" do
    plan = FactoryBot.build(:plan, sale_to: nil)
    plan.valid?
    expect(plan.errors[:sale_to]).to include("を入力してください")
  end

  it "is invalid without room_type" do
    plan = FactoryBot.build(:plan, room_type: nil)
    plan.valid?
    expect(plan.errors[:room_type]).to include("を入力してください")
  end

end
