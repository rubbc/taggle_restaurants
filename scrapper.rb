require 'open-uri'
require 'nokogiri'

url = "https://www.mangercacher.com/mon-quartier.php"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('div.listResultProxi div.name').each do |element|
  print element.text
end


# restos.forEach((item) => {
#   console.log(item.innerText);
# });
