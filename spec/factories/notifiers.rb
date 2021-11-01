FactoryBot.define do
  factory :notifier do
    platform { 'MyString' }
    credentials { '' }
    active { false }
  end
end
