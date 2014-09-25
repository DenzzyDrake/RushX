json.array!(@articles) do |article|
  json.extract! article, :id, :title, :author, :published_at, :content, :picture
  json.url article_url(article, format: :json)
end
