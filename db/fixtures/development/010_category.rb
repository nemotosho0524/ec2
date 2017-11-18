20.times do |i|
  Category.seed_once(:id) do |category|
    category.id = i + 1
    category.name = "カテゴリー#{i + 1}"
  end
end