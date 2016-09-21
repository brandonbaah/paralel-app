json.array! @activities.each do |activity|
  json.id activity.id
  json.event activity.event
  json.recordable_id activity.recordable_id
  json.recordable_type activity.recordable_type
  json.user_id activity.user_id
end
