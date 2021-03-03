require "rails_helper"

RSpec.describe User, type: :model do
  context "レコードに name, email, providerを指定している時" do
    let(:user) { build(:user) }
    it "ユーザー登録ができる" do
      expect(user).to be_valid
    end
  end

  context "レコードに nameのみ記入している時" do
    let(:user) { build(:user, email: nil, password: nil) }
    it "未記入の欄があります" do
      expect(user).not_to be_valid
    end
  end

  context "email がない場合" do
    let(:user) { build(:user, email: nil) }

    it "未記入の欄があります" do
      expect(user).not_to be_valid
    end
  end
end
