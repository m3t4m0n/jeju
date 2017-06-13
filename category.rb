require 'nokogiri'
require 'open-uri'

service_key = '3RjriFyFWZh3mfSJV03c94Sxch%2FEm8F7m7JSt4YX%2BQbIa7h4lS481NL1gfnnsvhtk7YAmZF5lROSE6kDLKvZIg%3D%3D'

category_url = 'http://openapi.culture.go.kr/openapi/service/ArtKnwldgLtrtrService/getArtKnwldgLtrtr?serviceKey=3RjriFyFWZh3mfSJV03c94Sxch%2FEm8F7m7JSt4YX%2BQbIa7h4lS481NL1gfnnsvhtk7YAmZF5lROSE6kDLKvZIg%3D%3D&ctgry2=H031&ctgry3='


hash_liter = { 0 => "H131",
	       1 => "H231", 
	       2 => "H331",
	       3 => "H431",
	       4 => "H531",
	       5 => "H631",
	       6 => "H731",
	     }

rand_num = Random.new.rand(0..6)

category_url << hash_liter[rand_num]

response_category = Nokogiri::HTML(open(category_url))

liter_length = response_category.xpath('//seq').length
liter_seq = response_category.xpath('//seq')[Random.new.rand(0...liter_length)]

seq_url = 'http://openapi.culture.go.kr/openapi/service/ArtKnwldgLtrtrService/getArtKnwldgLtrtrDetail?serviceKey=3RjriFyFWZh3mfSJV03c94Sxch%2FEm8F7m7JSt4YX%2BQbIa7h4lS481NL1gfnnsvhtk7YAmZF5lROSE6kDLKvZIg%3D%3D&seq='

seq_url << liter_seq
response_liter = Nokogiri::HTML(open(seq_url))

item = response_liter.xpath('//item//contents/text()')[1]
puts item
