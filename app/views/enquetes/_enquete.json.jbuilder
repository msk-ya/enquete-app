json.extract! enquete, :id, :title, :content, :created_at, :updated_at
json.url enquete_url(enquete, format: :json)
