json.extract! post, :id, :name, :problem, :latitude, :longitude, :display, :created_at, :updated_at
json.url post_url(post, format: :json)
