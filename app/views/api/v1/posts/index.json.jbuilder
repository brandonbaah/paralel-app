json.array! @posts.each do |post|
  json.id post.id
  json.text post.text
  json.user_id post.user_id
  json.user post.user
end
