class FileType < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :another_posts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["file_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["post", "another_post"]
  end
  enum file_name: [
    "app/", "app/assets/", "app/controllers/_controller.rb", "app/models/.rb",
    "app/views/.html.erb", "app/helpers/", "bin/", "config/",
    "config/routes.rb", "config/locales/ja.yml", "db/", "db/migrate/.rb",
    "lib/", "log/", "public/", "spec/", "storage/", "tmp/",
    "vendor/", ".browserslistrc", ".gitattributes", ".gitignore", 
    "Gemfile", "Rakefile", "Read.me", "その他"
  ]
end
