json.array!(@posts) do |post|
  json.extract! post, :id, :Category, :Question
  json.url post_url(post, format: :json)
end
