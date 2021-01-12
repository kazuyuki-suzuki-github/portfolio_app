require 'rails_helper'

RSpec.describe Search, type: :model do
  
  it "is valid with prefecture, checkin, checkout, people" do
    search = FactoryBot.build(:search)
    expect(search).to be_valid
  end

  it "is invalid without prefecture_id" do
    search = FactoryBot.build(:search, prefecture_id: nil)
    search.valid?
    expect(search.errors[:prefecture_id]).to include("を入力してください")
  end

  it "is invalid without checkin" do
    search = FactoryBot.build(:search, checkin: nil)
    search.valid?
    expect(search.errors[:checkin]).to include("を入力してください")
  end

  it "is invalid without checkout" do
    search = FactoryBot.build(:search, checkout: nil)
    search.valid?
    expect(search.errors[:checkout]).to include("を入力してください")
  end

  it "is invalid without people" do
    search = FactoryBot.build(:search, people: nil)
    search.valid?
    expect(search.errors[:people]).to include("を入力してください")
  end

  it "is invalid checkin and checkout before today " do
    search = FactoryBot.build(:search,
      checkin: (Date.today).strftime(),
      checkout: (Date.today).strftime())
    search.valid?
    expect(search.errors[:checkin]).to include("本日以降の日付を入力してください")
    expect(search.errors[:checkout]).to include("本日以降の日付を入力してください")
  end

  it "is invalid checkin after checkout" do
    search = FactoryBot.build(:search,
      checkin: (Date.today+3).strftime())
    search.valid?
    expect(search.errors[:checkout]).to include("チェックアウト日はチェックイン日より後の日付にしてください")
  end
end
