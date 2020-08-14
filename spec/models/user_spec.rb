require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it "全ての項目が入力されていれば登録できる"do
        expect(@user).to be_valid
      end

      it "emailに＠が含まれていれば登録できる"do
        @user.email = "aaa@bbb"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合で6文字以上であれば登録できる"do
        @user.password = "123abc"
        expect(@user).to be_valid
      end

      it "famiry_nameとfirst_nameが存在し、漢字・ひらがな・カタカナであれば登録できる"do
        @user.famiry_name = "名字"
        @user.first_name = "名前"
        expect(@user).to be_valid
      end

      it "famiry_name_kanaとfist_name_kanaが存在し、カタカナであれば登録できる"do
        @user.family_name_kana = "ミョウジ"
        @user.first_name_kana = "ナマエ"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録が上手くいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it"emailに@がないと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字混合でない場合登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end

      it "family_nameが漢字・ひらがな・カタカナ以外だと登録できない" do
        @user.family_name = "myouji"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name is invalid")
      end

      it "first_nameが漢字・ひらがな・カタカナ以外だと登録できない" do
        @user.first_name = "namae"
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name is invalid")
      end

      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      
      it "family_name_kanaがカタカナ以外だと登録できない" do
        @user.family_name_kana = "名字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_kana is invalid")
      end

      it "first_name_kanaがカタカナ以外だと登録できない" do
        @user.first_name_kana = "名前"
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana is invalid")
      end

      it "birthdayが空のだと登録できない"do
        @user.birthday =  ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
