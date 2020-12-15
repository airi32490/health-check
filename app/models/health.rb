class Health < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  with_options presence: true do
    validates :body_temperature
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :alcohol_level
    validates :user_id
  end
end
