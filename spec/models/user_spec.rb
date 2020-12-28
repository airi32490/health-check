require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'name, email, password, password_confirmation, checker_idが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が失敗するとき' do
      it 'nameが空だと失敗する' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください', '名前は全角で入力してください')
      end
      it 'nameが半角カタカナだと失敗する' do
        @user.name = 'ｽｽﾞｷｲﾁﾛｰ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
      it 'emailが空では失敗する' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合は失敗する' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@が含まれていないと失敗する' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと失敗する' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordとpassword_confirmationが不一致だと失敗する' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'password_confirmationが空だと失敗する' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが5文字以下だと失敗する' do
        @user.password = 'a1234'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが数字だけだと失敗する' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字を含めてください')
      end
      it 'passwordが英語だけだと失敗する' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字を含めてください')
      end
      it 'checker_idが空だと失敗する' do
        @user.checker_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('資格の有無を入力してください')
      end
      it 'checker_idがid=1を選択していると失敗する' do
        @user.checker_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('資格の有無を選択してください')
      end
    end
  end
end
