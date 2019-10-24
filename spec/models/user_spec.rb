require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      user = create(:user)
      expect(user.valid?).to eq true
    end
  end

  context "accountが指定されていない場合" do
    it "エラーする" do
      user = build(:user, account: nil)
      user.valid?

      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end

  context "同名のaccountが存在するとき" do
    before do
      User.create!(name: "chinju", account: "chinju", email: "chinju@example.com")
    end

    it "エラーする" do
      user = User.new(name: "chinju", account: "chinju", email: "chinju@example.com")
      user.valid?

      expect(user.errors.messages[:account]).to include "has already been taken"
    end
  end
end
