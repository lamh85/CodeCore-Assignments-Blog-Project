# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
FactoryGirl.define do

  factory :post do
    user
    title "I am a title"
    body "I am a body"
  end

end


#         :id => :integer,
#      :title => :string,
#       :body => :text,
# :created_at => :datetime,
# :updated_at => :datetime,
#    :user_id => :integer