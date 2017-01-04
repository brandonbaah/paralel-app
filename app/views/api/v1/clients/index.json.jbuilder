json.array! @clients.each do |client|
  json.id client.id
  json.latitude client.latitude
  json.longitude client.longitude
  json.name client.name
  json.address client.address
  json.phone client.phone
  json.image client.image
  json.visit_today client.visit_today

  json.case_notes client.case_notes.each do |case_note|
    json.id case_note.id
    json.note case_note.note
    json.date case_note.date
    json.created_at case_note.created_at
  end

  json.check_lists client.check_lists.each do |check_list|
    json.id check_list.id
    json.goal check_list.goal
    json.complete check_list.complete
    json.created_at check_list.created_at
  end
end
