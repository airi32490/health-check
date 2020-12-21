FactoryBot.define do
  factory :health do
    body_temperature { 36.5 }
    condition_id     { 2 }
    alcohol_level    { 0.1 }
  end
end