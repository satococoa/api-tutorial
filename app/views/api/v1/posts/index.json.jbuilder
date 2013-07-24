json.array!(@posts) do |post|
  json.extract! post, :title, :name, :body
end