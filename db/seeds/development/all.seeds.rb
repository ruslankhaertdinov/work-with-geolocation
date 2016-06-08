FactoryGirl.create(:user, email: "user@example.com")

CITIES = %w(Abakan Baksan Chelyabinsk Dalmatovo Elista Frolovo Grozny Irkutsk Kazan Leninogorsk
           Moscow Naginsk Orsk Penza Rostov Saransk Tambov Ufa Vologda Yakutsk Zainsk
         )
CITIES.each do |city|
  FactoryGirl.create(:user, email: "user-#{city.downcase}@example.com", city: city)
end
