class AnotherPost < ApplicationRecord
  enum status_error_name: ["Name Error", "No Method Error", "Template is missing", "LoadError", "Actioncontroller::UnknownFormat", "ArgumentError", "Syntax error", "その他"]
end
