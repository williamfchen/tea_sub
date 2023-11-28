customer1 = Customer.create!(first_name: "Will", last_name: "Doe", email: "will@will.com", address: "454 Denver St")
customer2 = Customer.create!(first_name: "Joe", last_name: "Does", email: "joe@does.com", address: "132 Main St")

tea1 = Tea.create!(title: "Oolong Tea", description: "Great tasting tea", temperature: "80°C", brew_time: "3 minutes")
tea2 = Tea.create!(title: "Green Tea", description: "pretty good tea", temperature: "80°C", brew_time: "2 minutes")
tea3 = Tea.create!(title: "Black Tea", description: "not bad tea", temperature: "90°C", brew_time: "4 minutes")