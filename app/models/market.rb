class Market < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options numericality: { with: /\A\d{4,5}[.]\d{2}\z/, message: "は小数点以下2桁で入力してください" } do
      validates :nikkei
      validates :ny_dow
    end
    with_options numericality: { with: /\A\d{2,3}[.]\d{2,3}\z/, message: "の小数点以下は2桁か3桁で入力してください" } do
      validates :us_dollar
      validates :euro
      validates :au_dollar
    end
    validates :user_id
  end
end