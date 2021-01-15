class Market < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options format: { with: /\A(\d{4,5})(\.[0-9]{2}?)\z/, message: "は半角数字で入力してください" } do
      validates :nikkei
      validates :ny_dow
    end
    with_options format: { with: /\A\d{2,3}\.(\d{3})\z/, message: "は半角数字で入力してください" } do
      validates :us_dollar
      validates :euro
      validates :au_dollar
    end
    validates :user_id
  end
end
