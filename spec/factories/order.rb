FactoryBot.define do
	factory :order do
		order_name "order"
		tel "0111111111"
		email "email@email.ne.jp"
		address "aaa"

		user
		post
	end
end
