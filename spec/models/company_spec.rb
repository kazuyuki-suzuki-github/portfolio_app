require 'rails_helper'

RSpec.describe Company, type: :model do
  
  it "is valid with name, address, info, prefecture_id" do
    c = FactoryBot.build(:company)
    expect(c).to be_valid
  end

  it "is invalid without name" do
    c = FactoryBot.build(:company, name: nil)
    c.valid?
    expect(c.errors[:name]).to include("を入力してください")
  end

  it "is invalid without address" do
    c = FactoryBot.build(:company, address: nil)
    c.valid?
    expect(c.errors[:address]).to include("を入力してください")
  end

  it "is invalid without access" do
    c = FactoryBot.build(:company, access: nil)
    c.valid?
    expect(c.errors[:access]).to include("を入力してください")
  end

  it "is invalid without info" do
    c = FactoryBot.build(:company, info: nil)
    c.valid?
    expect(c.errors[:info]).to include("を入力してください")
  end

  it "is invalid without prefecture_id" do
    c = FactoryBot.build(:company, prefecture_id: nil)
    c.valid?
    expect(c.errors[:prefecture_id]).to include("を入力してください")
  end

  it "is invalid 256 character name" do
    c = FactoryBot.build(:company, name: "a"*256)
    c.valid?
    expect(c.errors[:name]).to include("は255文字以内で入力してください")
  end

  it "is invalid 256 character address" do
    c = FactoryBot.build(:company, address: "a"*256)
    c.valid?
    expect(c.errors[:address]).to include("は255文字以内で入力してください")
  end

  it "is invalid 256 character access" do
    c = FactoryBot.build(:company, access: "a"*256)
    c.valid?
    expect(c.errors[:access]).to include("は255文字以内で入力してください")
  end

end
