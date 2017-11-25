62.times do |i|
  Post.seed do |post|
    post.id = i + 1
    post.name = "商品#{i + 1}"
    post.price = (i + 1) * 1000
    post.description = "商品#{i + 1}の説明"
    post.category_id = rand(1..20)
    post.user_id = 1
  end
end