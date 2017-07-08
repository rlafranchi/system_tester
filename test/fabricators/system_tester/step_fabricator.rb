Fabricator(:step, from: 'SystemTester::Step') do
  title { Faker::Lorem.words(2).join(" ") }
  arg_one { Faker::Lorem.words(2).join(" ") }
  arg_two { Faker::Lorem.words(2).join(" ") }
end