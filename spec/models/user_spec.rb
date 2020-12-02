require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context "新規登録がうまくいく時" do
      it "全ての項目の入力が正しく存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていないと登録できない" do
       @user.email = "sample.sample"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailは一意である" do
        @user.save
        another_user=FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      #it "passwordは半角英数字混合でないと登録できない" do
        #@user.password = "aaaaaaa"
        #@user.valid?
        #expect(@user.errors.full_messages).to include("Password doesn't match Password")
      #end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角入力でなければ登録できない" do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角入力でなければ登録できない" do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "first_name_katakanaが全角カタカナ入力でなければ登録できない" do
        @user.first_name_katakana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it "last_name_katakanaが空では登録できない" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "first_nameが全角入力でなければ登録できない" do
        @user.last_name_katakana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it "birth_dayがない場合は登録できないこと" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors[:birth_day]).to include("can't be blank")
      end
    end
  end
  
end