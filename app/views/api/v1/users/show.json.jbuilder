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
