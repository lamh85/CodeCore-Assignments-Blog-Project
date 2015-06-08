# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
FactoryGirl.define do
  factory :user do
    first_name "some first name"
    last_name "some last name"
    password "password"
    sequence(:email) {|n| "some_email#{n}@gmail.com" }
  end

  factory :post do
    user
    sequence(:title) {|n| "I am a title #{n}"}
    sequence(:body) {|n| "I am a body #{n}"}
  end

end