json.array! @comments.each do |comment|
  json.id comment.id
  json.text comment.text
  json.activity_id comment.activity_id
  json.user_id comment.user_id
  json.first_name comment.user.first_name
  json.image comment.user.image
end
