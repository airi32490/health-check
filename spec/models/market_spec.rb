require 'rails_helper'

RSpec.describe Market, type: :model do
  before do
    user = FactoryBot.create(:user)
    @market = FactoryBot.build(:market, user_id: user.id)
  end

  describe 'マーケット情報登録' do
    context 'マーケット情報が登録できるとき' do
      it 'nikkei, ny_dow, us_dollar, euro, au_dollarが全て存在すれば登録できる' do
        expect(@market).to be_valid
      end
    end

    context 'マーケット情報の登録に失敗するとき' do
      it 'nikkeiが空だと失敗する' do
        @market.nikkei = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('日経平均株価を入力してください')
      end
      it 'nikkeiを全角数字で入力すると失敗する' do
        @market.nikkei = '１００００.１１'
        @market.valid?
        expect(@market.errors.full_messages).to include('日経平均株価は半角数字で入力してください')
      end
      it 'ny_dowが空だと失敗する' do
        @market.ny_dow = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('NYダウを入力してください')
      end
      it 'ny_dowを全角数字で入力すると失敗する' do
        @market.ny_dow = '２００００.２２'
        @market.valid?
        expect(@market.errors.full_messages).to include('NYダウは半角数字で入力してください')
      end
      it 'us_dollarが空だと失敗する' do
        @market.us_dollar = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('アメリカ合衆国ドルを入力してください')
      end
      it 'us_dollarを全角数字で入力すると失敗する' do
        @market.us_dollar = '１００.１１'
        @market.valid?
        expect(@market.errors.full_messages).to include('アメリカ合衆国ドルは半角数字で入力してください')
      end
      it 'euroが空だと失敗する' do
        @market.euro = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('ユーロを入力してください')
      end
      it 'euroを全角数字で入力すると失敗する' do
        @market.euro = '２２２.２２'
        @market.valid?
        expect(@market.errors.full_messages).to include('ユーロは半角数字で入力してください')
      end
      it 'au_dollarが空だと失敗する' do
        @market.au_dollar = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('オーストラリアドルを入力してください')
      end
      it 'au_dollarを全角数字で入力すると失敗する' do
        @market.au_dollar = '８０.８８８'
        @market.valid?
        expect(@market.errors.full_messages).to include('オーストラリアドルは半角数字で入力してください')
      end
      it 'user_idが紐づいていないと失敗する' do
        @market.user_id = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
