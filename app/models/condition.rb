class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '良好' },
    { id: 3, name: '普通' },
    { id: 4, name: '不調' }
  ]

  include ActiveHash::Associations
  has_many :healths

end
