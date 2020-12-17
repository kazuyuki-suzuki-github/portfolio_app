require 'rails_helper'

RSpec.describe Plan, type: :model do
  it 'is valid with company_id, name, check_in, check_out, stock, price, sale_from, sale_to, room_type' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(true)
  end

  it 'is invalid without company_id' do
    p = Plan.new(
      company_id:nil, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without name' do
    p = Plan.new(
      company_id:1, 
      name:nil, 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without check_in' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:nil, 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without check_out' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:nil, 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without stock' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:nil, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without price' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:nil, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without sale_from' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:nil, 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without sale_to' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:nil, 
      room_type:1)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid without room_type' do
    p = Plan.new(
      company_id:1, 
      name:'name', 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:nil)
    expect(p.valid?).to eq(false)
  end

  it 'is invalid with 256 charcter in name' do
    p = Plan.new(
      company_id:1, 
      name:'a' * 256, 
      check_in:Time.parse('15:00'), 
      check_out:Time.parse('10:00'), 
      stock:100, 
      price:15000, 
      sale_from:Time.parse('2020-12-01'), 
      sale_to:Time.parse('2020-12-31'), 
      room_type:1)
    expect(p.valid?).to eq(false)
  end
end
