json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :sake_id, :comment
  json.url review_url(review, format: :json)
end
