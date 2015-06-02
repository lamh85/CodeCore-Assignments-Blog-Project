json.array! @posts do |post|

  json.(post, :id, :title, :body)

  json.user do
    json.id post.user.id
    json.first_name post.user.first_name
    json.last_name post.user.last_name
  end

  json.comments do |comment|
    json.(comment, :body)
  end
end