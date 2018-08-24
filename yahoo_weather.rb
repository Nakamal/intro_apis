require 'http'

system "clear"

response = HTTP.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

data = response.parse

channel = data["query"]["results"]["channel"]

temp_unit = channel["units"]["temperature"]

condition = channel["units"]["temperature"]
temperature = channel["item"]["condition"]["temp"]
city = channel["location"]["city"]
state = channel["city"]["region"]

p city
p state



p temp_unit