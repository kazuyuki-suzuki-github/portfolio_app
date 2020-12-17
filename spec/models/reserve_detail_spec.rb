require 'rails_helper'

RSpec.describe ReserveDetail, type: :model do
  it 'is valid with check_in, check_out, people, reserve_id' do
    rd = ReserveDetail.new(
      check_in:Time.parse('2020-12-01'), check_out:Time.parse('2020-12-02'), people:1, reserve_id:1)
    expect(rd.valid?).to eq(true)
  end

  it 'is invalid without check_in' do
    rd = ReserveDetail.new(
      check_in:nil, check_out:Time.parse('2020-12-02'), people:1, reserve_id:1)
    expect(rd.valid?).to eq(false)
  end

  it 'is invalid without check_out' do
    rd = ReserveDetail.new(
      check_in:Time.parse('2020-12-01'), check_out:nil, people:1, reserve_id:1)
    expect(rd.valid?).to eq(false)
  end

  it 'is invalid without people' do
    rd = ReserveDetail.new(
      check_in:Time.parse('2020-12-01'), check_out:Time.parse('2020-12-02'), people:nil, reserve_id:1)
    expect(rd.valid?).to eq(false)
  end

  it 'is invalid without reserve_id' do
    rd = ReserveDetail.new(
      check_in:Time.parse('2020-12-01'), check_out:Time.parse('2020-12-02'), people:1, reserve_id:nil)
    expect(rd.valid?).to eq(false)
  end
end
