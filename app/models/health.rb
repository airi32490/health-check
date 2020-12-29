class Health < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  with_options presence: true do
    validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :user_id
    with_options numericality: { only_float: true, message: 'は半角数字で入力してください' } do
      validates :body_temperature
      validates :alcohol_level
    end
  end
end