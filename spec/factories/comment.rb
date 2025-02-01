FactoryBot.define do
    factory :comment do
      content { "Sample comment content" }
      association :project
      association :user
    end
end