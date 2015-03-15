Fabricator(:room) do
	room_name { Faker::Name.first_name }
	rent { Faker::Number.number(3) }
end