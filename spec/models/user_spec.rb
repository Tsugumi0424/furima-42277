require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '必須項目が空の場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      [:last_name, :first_name, :last_name_kana, :first_name_kana].each do |attribute|
        it "#{attribute}が空では登録できない" do
          @user[attribute] = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("#{attribute.to_s.humanize} can't be blank")
        end
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end

    context 'パスワードの形式が不正な場合' do
      %w[abcdef 123456].each do |invalid_password|
        it "passwordが「#{invalid_password}」では登録できない" do
          @user.password = invalid_password
          @user.password_confirmation = invalid_password
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
        end
      end
    end

    context '名前関連の形式が不正な場合' do
      [[:last_name, 'Last name is invalid. Input full-width characters'],
       [:first_name, 'First name is invalid. Input full-width characters'],
       [:last_name_kana, 'Last name kana is invalid. Input full-width katakana characters'],
       [:first_name_kana, 'First name kana is invalid. Input full-width katakana characters']].each do |attribute, message|
        it "#{attribute}が無効な値では登録できない" do
          @user[attribute] = 'abc123'
          @user.valid?
          expect(@user.errors.full_messages).to include(message)
        end
      end
    end
  end
end
