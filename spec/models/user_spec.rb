require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user, nickname: '')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user, password: '', password_confirmation: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上でなければ登録できない' do
      user = FactoryBot.build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      user = FactoryBot.build(:user, password: '000000', password_confirmation: '000001')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'emailが一意でなければ登録できない' do
      FactoryBot.create(:user, email: 'test@example.com')
      user = FactoryBot.build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていなければ登録できない' do
      user = FactoryBot.build(:user, email: 'testexample.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'すべての情報が正しく入力されていれば登録できる' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'last_nameが空では登録できない' do
      user = FactoryBot.build(:user, last_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user, first_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user, last_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user, first_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dateが空では登録できない' do
      user = FactoryBot.build(:user, birth_date: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = FactoryBot.build(:user, last_name: 'yamada')
      user.valid?
      expect(user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = FactoryBot.build(:user, first_name: 'taro')
      user.valid?
      expect(user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      user = FactoryBot.build(:user, last_name_kana: 'やまだ')
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana は全角（カタカナ）で入力してください')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      user = FactoryBot.build(:user, first_name_kana: 'たろう')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana は全角（カタカナ）で入力してください')
    end
  end
end
