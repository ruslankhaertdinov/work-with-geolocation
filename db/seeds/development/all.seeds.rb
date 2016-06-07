FactoryGirl.create(:user, email: "user@example.com")

%w(Moscow Kazan Florida).each do |city|
  FactoryGirl.create(:user, email: "user-#{city.downcase}@example.com", city: city)
end
