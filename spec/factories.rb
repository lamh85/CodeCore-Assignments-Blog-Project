# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
FactoryGirl.define do

  factory :post do
    user
    title "I am a title"
    body "I am a body"
  end

  factory :user do
    first_name "some first name"
    last_name "some last name"
    password "password"
    sequence(:email) {|n| "some_email#{n}@gmail.com" }
  end

end