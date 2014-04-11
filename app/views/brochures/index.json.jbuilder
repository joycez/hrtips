json.array!(@brochures) do |brochure|
  json.extract! brochure, :id
  json.url brochure_url(brochure, format: :json)
end
