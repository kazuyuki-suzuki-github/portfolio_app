require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with name, email, password" do
    user = User.new(
      name: "suzuki",
      email: "sample@test.com",
      password: "password"
    )
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid without password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is invalid with a duplicate email" do
    User.create(
      name: "satou",
      email: "sample@test.com",
      password: "password"
    )
    user = User.new(
      name: "kobayashi",
      email: "sample@test.com",
      password: "password"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid with a 16 characters name" do
    user = User.new(name: "a"*16)
    user.valid?
    expect(user.errors[:name]).to include("は15文字以内で入力してください")
  end

  it "is invalid with a 256 characters email" do
    user = User.new(email: "a"*256)
    user.valid?
    expect(user.errors[:email]).to include("は255文字以内で入力してください")
  end

end