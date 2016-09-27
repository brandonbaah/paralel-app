json.array! @checklists.each do |checklist|
  json.id checklist.id
  json.goal checklist.goal
  json.user_id checklist.user_id
  json.client_id checklist.client_id
  json.complete checklist.complete
end
