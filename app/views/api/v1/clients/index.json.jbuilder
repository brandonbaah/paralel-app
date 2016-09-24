json.array! @comments.each do |client|
  json.id client.id
  json.latitude client.latitude
  json.longitude client.longitude
  json.name client.name
  json.address client.address
  json.phone client.phone
  json.visit_today client.visit_today
end
