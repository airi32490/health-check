class Health < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  with_options presence: true do
    validates :body_temperature, numericality: { only_float: true, message: 'は半角数字で入力してください' }
    validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :alcohol_level, numericality: { only_float: true, message: 'は半角数字で入力してください' }
    validates :user_id
  end
end
