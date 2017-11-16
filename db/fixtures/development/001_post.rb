60.times do |i|
  Post.seed_once(:id) do |post|
    post.id = i + 1
    post.name = "商品#{i + 1}"
    post.price = (i + 1) * 1000
    post.description = "商品#{i + 1}の説明"
  end
end