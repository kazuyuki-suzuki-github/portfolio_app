require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, email' do
    u = User.new(name:'name', email:'email', coin:100, password_digest:'password_digest')
    expect(u.valid?).to eq(true)
  end

  it 'is invalid without name' do
    u = User.new(name:nil, email:'email', coin:100, password_digest:'password_digest')
    expect(u.valid?).to eq(false)
  end

  it 'is invalid without email' do
    u = User.new(name:'name', email:nil, coin:100, password_digest:'password_digest')
    expect(u.valid?).to eq(false)
  end

  it 'is invalid with 16 charcter in name' do
    u = User.new(name:'a' * 16, email:'email', coin:100, password_digest:'password_digest')
    expect(u.valid?).to eq(false)
  end

  it 'is invalid with 256 charcter in email' do
    u = User.new(name:'name', email:'a' * 256, coin:100, password_digest:'password_digest')
    expect(u.valid?).to eq(false)
  end
end
