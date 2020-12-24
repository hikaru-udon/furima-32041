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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに＠が含まれていないと登録できない" do
       @user.email = "sample.sample"
       @user.valid?
       expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "emailは一意である" do
        @user.save
        another_user=FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは半角英語のみでは登録できない" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは半角数字のみでは登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは全角では登録できない" do
        @user.password = "ｐａｓｓｗａｒｄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが存在してもpassword_confirmationが無いと登録できない" do
        @user.password_confirmation = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "first_nameは全角入力でなければ登録できない" do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it "last_nameが全角入力でなければ登録できない" do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it "first_name_katakanaが全角カタカナ入力でなければ登録できない" do
        @user.first_name_katakana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "last_name_katakanaが空では登録できない" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it "first_nameが全角入力でなければ登録できない" do
        @user.last_name_katakana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）は不正な値です")
      end
      it "birth_dayがない場合は登録できないこと" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors[:birth_day]).to include("を入力してください")
      end
    end
  end
  
end