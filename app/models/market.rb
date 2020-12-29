class Market < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options numericality: { with: /\A\d{5}[.]\d{2}\z/, message: "は整数5桁、小数点以下2桁で入力してください" } do
      validates :nikkei
      validates :ny_dow
    end
    with_options numericality: { with: /\A\d{3}[.]\d{3}\z/, message: "は整数3桁、小数点以下3桁で入力してください" } do
      validates :us_dollar
      validates :euro
      validates :au_dollar
    end
    validates :user_id
  end
end