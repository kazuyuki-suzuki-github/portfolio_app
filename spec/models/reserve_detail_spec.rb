require 'rails_helper'

RSpec.describe ReserveDetail, type: :model do
  
  it "is valid with check_in, check_out, people, reserve_id" do
    reserveDetail = FactoryBot.build(:reserve_detail)
    expect(reserveDetail).to be_valid
  end

  it "is invalid without check_in" do
    reserveDetail = FactoryBot.build(:reserve_detail, check_in: nil)
    reserveDetail.valid?
    expect(reserveDetail.errors[:check_in]).to include("を入力してください")
  end

  it "is invalid without check_out" do
    reserveDetail = FactoryBot.build(:reserve_detail, check_out: nil)
    reserveDetail.valid?
    expect(reserveDetail.errors[:check_out]).to include("を入力してください")
  end

  it "is invalid without people" do
    reserveDetail = FactoryBot.build(:reserve_detail, people: nil)
    reserveDetail.valid?
    expect(reserveDetail.errors[:people]).to include("を入力してください")
  end

  it "is invalid without reserve_id" do
    reserveDetail = FactoryBot.build(:reserve_detail, reserve_id: nil)
    reserveDetail.valid?
    expect(reserveDetail.errors[:reserve_id]).to include("を入力してください")
  end

end
