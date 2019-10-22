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
    it "エラーする" do
      create(:user, account: "chinju")
      user = build(:user, account: "chinju")
      user.valid?

      expect(user.errors.messages[:account]).to include "has already been taken"
    end
  end
end
