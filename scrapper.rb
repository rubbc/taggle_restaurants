require 'open-uri'
require 'nokogiri'



nb = '12'
url = "https://www.123cacher.fr/restaurants/ile_de_france/paris/?pg=#{nb}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('div.fresto-listing-v2 h3').each do |element|
  puts element.text.strip
end

# html_doc.search('div.fresto-listing-v2 h4').each do |element|
#   puts element.text.strip
# end

