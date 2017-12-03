FactoryBot.define do
	factory :post do
		name "post"
		price 1000
		description "post's description"
		user_id 1
		category_id 1
		
		category
	end
end