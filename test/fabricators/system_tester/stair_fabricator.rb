Fabricator(:stair, from: 'SystemTester::Stair') do
  title { Faker::Lorem.words(2).join(" ") }
end