json.array!(@consultancies) do |consultancy|
  json.extract! consultancy, :id, :pitch_id, :body, :consaltant_id, :approved
  json.url consultancy_url(consultancy, format: :json)
end
