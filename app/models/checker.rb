class Checker < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '確認者資格有り' },
    { id: 3, name: '確認者資格無し' },
  ]

  include ActiveHash::Associations
  has_many :users

end
