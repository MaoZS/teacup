json.array!(@teas) do |tea|
  json.extract! tea, :id, :name, :title, :text, :date, :code
  json.url tea_url(tea, format: :json)
end
