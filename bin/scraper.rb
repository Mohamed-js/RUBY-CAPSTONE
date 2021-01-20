require_relative '../lib/scraper_class.rb'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new

# USE crawl method and saving its information ::

# 1-enter Link of page
puts "Enter the page link 'url' to be scraped:"
link = gets.chomp
p link

# 2-enter SELECTOR of the name of product
puts 'Enter the page SELECTOR of the name:'
name = gets.chomp
p name

# 3-enter  SELECTOR of the <a> link of product
puts "Enter the page SELECTOR of the link 'product page':"
product_page = gets.chomp
p product_page

# 4-enter  SELECTOR of the img of product
puts 'Enter the page SELECTOR of the img element:'
img = gets.chomp
p img

# 5-enter  SELECTOR of the price of product
puts 'Enter the page SELECTOR of the price:'
price = gets.chomp
p price

puts 'Wait seconds ......'

# Fictional method!!
# goods = scraper.crawl(link, name, product_page, img, price)

# RUN Method
goods = scraper.crawl('https://fashion.souq.com/eg-en/fashion-best-deals/c/15693', 'h6.title a', 'h6.title a', 'a.img-link img', 'h5.price span.is')

# Display Items
goods.each do |good|
  puts ' ------------- '
  puts "Name    :: ".yellow + "#{good[:name]}"
  puts "Price   :: ".yellow + "#{good[:price]}"
  puts "img-src :: ".yellow + "#{good[:img_src]}"
  puts "Product :: ".yellow + "#{good[:link]}"
end

puts "Successfully done...".green

# ruby bin/scraper.rb
