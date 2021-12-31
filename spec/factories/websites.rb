FactoryBot.define do
  factory :website do
    title { 'Google' }
    url { 'https://google.com' }
    schedule { '* * * * *' }
    active { true }
  end
end
