require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with company_id,name,address,access,info,prefecture_id' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'address',
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(true)
  end

  it 'is invalid without company_id' do
    c = Company.new(
      company_id:nil,
      name:'name',
      address:'address',
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid without name' do
    c = Company.new(
      company_id:1,
      name:nil,
      address:'address',
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid without address' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:nil,
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid without access' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'address',
      access:nil,
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid without info' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'address',
      access:'access',
      info:nil,
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid without prefecture_id' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'address',
      access:'access',
      info:'info',
      prefecture_id:nil)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid with 256 charcter in name' do
    c = Company.new(
      company_id:1,
      name:'a' * 256,
      address:'address',
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid with 256 charcter in address' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'a' * 256,
      access:'access',
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

  it 'is invalid with 256 charcter in access' do
    c = Company.new(
      company_id:1,
      name:'name',
      address:'address',
      access:'a' * 256,
      info:'info',
      prefecture_id:1)
    expect(c.valid?).to eq(false)
  end

end
