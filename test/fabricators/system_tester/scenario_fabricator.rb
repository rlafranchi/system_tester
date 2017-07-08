Fabricator(:scenario, from: 'SystemTester::Scenario') do
  title { Faker::Lorem.words(2).join(" ") }
  feature
end