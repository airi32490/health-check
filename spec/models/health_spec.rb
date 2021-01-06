require 'rails_helper'

RSpec.describe Health, type: :model do
  before do
    user = FactoryBot.create(:user)
    @health = FactoryBot.build(:health, user_id: user.id)
  end

  describe '体調情報登録' do
    context '体調情報が登録できるとき' do
      it 'body_temperature, condition_id, alcohol_levelが全て存在すれば登録できる' do
        expect(@health).to be_valid
      end
    end

    context '体調情報の登録に失敗するとき' do
      it 'bode_temperatureが空だと失敗する' do
        @health.body_temperature = nil
        @health.valid?
        expect(@health.errors.full_messages).to include('体温を入力してください')
      end
      it 'body_tempetatureを全角数字で入力すると失敗する' do
        @health.body_temperature = '３６'
        @health.valid?
        expect(@health.errors.full_messages).to include('体温は半角数字で入力してください')
      end
      it 'condition_idが空だと失敗する' do
        @health.condition_id = nil
        @health.valid?
        expect(@health.errors.full_messages).to include('体調を入力してください')
      end
      it 'condition_idがid=1を選択していると失敗する' do
        @health.condition_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include('体調を選択してください')
      end
      it 'alcohol_levelが空だと失敗する' do
        @health.alcohol_level = nil
        @health.valid?
        expect(@health.errors.full_messages).to include('アルコール数値を入力してください')
      end
      it 'alcohol_levelを全角数字で入力すると失敗する' do
        @health.alcohol_level = '１'
        @health.valid?
        expect(@health.errors.full_messages).to include('アルコール数値は半角数字で入力してください')
      end
      it 'user_idが紐づいていないと失敗する' do
        @health.user_id = nil
        @health.valid?
        expect(@health.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
