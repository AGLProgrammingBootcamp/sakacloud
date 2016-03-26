json.array!(@sakes) do |sake|
  json.extract! sake, :id, :name, :place, :user_id
  json.url sake_url(sake, format: :json)
end
