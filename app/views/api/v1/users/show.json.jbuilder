json.id @user.id
json.first_name @user.first_name
json.last_name @user.last_name
json.email @user.email
json.role_id @user.role_id
json.admin @user.admin
json.director_id @user.director_id
json.supervisor_id @user.supervisor_id

json.activities @actions.each do |action|
  json.id action.id
  json.event action.event
  json.recordable_id action.recordable_id
  json.recordable_type action.recordable_type
  json.user_id action.user_id
  json.updated_at action.updated_at
  json.created_at action.created_at
  json.display_text action.display_text
  if action.recordable_type == "Client"
    json.client_name action.recordable.name
    json.client_id action.recordable.id
  elsif action.recordable_type == "CaseNote" || action.recordable_type == "CheckList"
    json.client_name action.recordable.client.name
    json.client_id action.recordable.client_id
  end

  json.user_id action.user.id
  json.first_name action.user.first_name
  json.last_name action.user.last_name
  json.email action.user.email
  json.role_id action.user.role_id
  json.admin action.user.admin
  json.director_id action.user.director_id
  json.supervisor_id action.user.supervisor_id


  json.comments action.comments.each do |comment|
    json.id comment.id
    json.text comment.text
    json.activity_id comment.activity_id
    json.user_id comment.user_id
    json.first_name comment.user.first_name
  end
end

json.check_lists @user.check_lists.each do |check_list|
  json.id check_list.id
  json.goal check_list.goal
  json.client_id check_list.client_id
  json.user_id check_list.user_id
end
