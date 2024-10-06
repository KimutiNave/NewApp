# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
file_type_names = [
  "app/", "app/assets/", "app/controllers/_controller.rb", "app/models/.rb",
  "app/views/.html.erb", "app/helpers/", "bin/", "config/",
  "config/routes.rb", "config/locales/ja.yml", "db/", "db/migrate/.rb",
  "lib/", "log/", "public/", "spec/", "storage/", "tmp/",
  "vendor/", ".browserslistrc", ".gitattributes", ".gitignore", 
  "Gemfile", "Rakefile", "Read.me", "その他"
]

file_type_names.each do |file|
  FileType.find_or_create_by!(file_name: file)
end

Admin.create!(name: ENV["NAME"], email: ENV["MAIL_PASS"], password: ENV["SECRET_KEY"], password_confirmation: ENV["SECRET_KEY"])
  