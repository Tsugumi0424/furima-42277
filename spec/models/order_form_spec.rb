require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
      sleep 1.0
    end

    context '商品購入できるとき' do
      it '必要な情報がすべて存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefectureが空では購入できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_numberが空では購入できない' do
        @order_form.street_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      %w[123456 abcdef あいうえお 漢字].each do |invalid_post_code|
        it "post codeが「#{invalid_post_code}」では購入できない" do
          @order_form.post_code = invalid_post_code
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
        end
      end

      it 'phone numberが9文字以下では登録できない' do
        @order_form.phone_number = Faker::Lorem.characters(number: 9)
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too short')
      end

      %w[abcdef あいうえお 漢字].each do |invalid_phone_number|
        it "phone numberが「#{invalid_phone_number}」では購入できない" do
          @order_form.phone_number = invalid_phone_number
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
        end
      end

      it 'ユーザーが紐付いていなければ購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'アイテムが紐付いていなければ購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
