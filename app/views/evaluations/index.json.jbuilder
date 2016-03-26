json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :sake_id, :user_id, :comment
  json.url evaluation_url(evaluation, format: :json)
end
