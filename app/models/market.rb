class Market < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options format: { with: /\A\d{4,5}[.]\d{2}\z/, message: "は、半角数字かつ、小数点以下2桁で入力してください" } do
      validates :nikkei
      validates :ny_dow
    end
    with_options format: { with: /\A\d{2,3}[.]\d{3}\z/, message: "は、半角数字かつ、小数点以下3桁で入力してください" } do
      validates :us_dollar
      validates :euro
      validates :au_dollar
    end
    validates :user_id
  end
end