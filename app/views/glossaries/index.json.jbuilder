json.array!(@glossaries) do |glossary|
  json.extract! glossary, :id
  json.url glossary_url(glossary, format: :json)
end
