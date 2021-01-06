class Market < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" } do
      validates :nikkei
      validates :ny_dow
      validates :us_dollar
      validates :euro
      validates :au_dollar
    end
    validates :user_id
  end
end