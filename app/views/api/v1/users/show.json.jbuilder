json.id @user.id
json.first_name @user.first_name
json.last_name @user.last_name
json.email @user.email
json.role_id @user.role_id
json.admin @user.admin
json.director_id @user.director_id
json.supervisor_id @user.supervisor_id

json.activities @user.actions.each do |action|
  json.id action.id
  json.event action.event
  json.recordable_id action.recordable_id
  json.recordable_type action.recordable_type
  json.user_id action.user_id
end

json.check_lists @user.check_lists.each do |check_list|
json.id check_list.id
json.goal check_list.goal
json.client_id check_list.client_id
json.user_id check_list.user_id
end
