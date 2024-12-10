FactoryBot.define do
  factory :admin do
    name { "adminuser" }
    email { "testadmin@gmail.com"}
    password { "admin12345"} 
    password_confirmation { "admin12345" }
    confirmed_at { Date.today }
  end
end
