require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      # （新規登録/ユーザー情報）
      it 'nicknameは空にできない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailは空にできない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは重複できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@を含まず登録することはできない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordは空にできない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'password_confirmationは空にできない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordは英数字混合でも5文字以下にはできない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'あああ２２２'
        @user.password_confirmation = 'あああ２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password 半角英数字混合で入力してください"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaBBB'
        @user.password_confirmation = 'aaaBBB'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password 半角英数字混合で入力してください"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password 半角英数字混合で入力してください"
      end
      it 'passwordと@passord_confirmationは不一致にできない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'ab1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      # （新規登録/本人確認情報）
      it 'last_nameは空にできない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name 全角で入力してください"
      end
      it 'first_nameは空にできない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name 全角で入力してください"
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力以外はできない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角で入力してください"
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力以外はできない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角で入力してください"
      end
      it 'last_name_kanaは空にできない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana 全角カタカナで入力してください"
      end
      it 'first_name_kanaは空にできない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana 全角カタカナで入力してください"
      end
      it 'last_name_kanaは全角（カタカナ）での入力以外はできない' do
        @user.last_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カタカナで入力してください"
      end
      it 'first_name_kanaは全角（カタカナ）での入力以外はできない' do
        @user.first_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナで入力してください"
      end
      it 'birthは空にできない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
    end
  end
end