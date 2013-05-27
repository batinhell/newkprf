atom_feed do |feed|
  feed.title "Все новости"
  feed.updated @posts.maximum(:updated_at)
  
  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content post.description.strip_tags
    end
  end
end