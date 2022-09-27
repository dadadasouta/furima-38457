require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー新規登録ができるとき" do
      it "全ての情報が入力されていれば登録できる" do
        expect(@user).to be_valid
      end

      it "nicknameが入力されていれば登録できる" do
        @user.nickname = 'tarou'
        expect(@user).to be_valid
      end

      it "emailに@が入っていれば登録できる" do
        @user.email = 'aaaa@mail.com'
        expect(@user).to be_valid
      end

      it "passwordが英数字で6文字以上入力されていれば登録できる" do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end

      it "family_nameが全角（漢字、ひらがな、カタカナ）であれば登録できる" do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end

      it "first_nameが全角（漢字、ひらがな、カタカナ）であれば登録できる" do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it "family_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end

      it "birth_dayが入力されていれば登録できる" do
        @user.birth_day = '1999-09-09'
        expect(@user).to be_valid
      end
    end

    context "ユーザー新規登録ができない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が入っていないと登録できない" do
        @user.email = 'aaaa.mail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "既に使用しているemailだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下だと登録できない" do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは英数字でないと登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password には英字と数字の両方を含めて設定してください")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dayが空だと登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
