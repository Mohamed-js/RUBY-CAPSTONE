require_relative '../lib/scraper_class.rb'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new

# WELCOME ::
puts '******************************************'
puts 'Welcome to scruby ruby doooooooooooooooooo ^_^'
puts ''
puts '******************************************'
puts '**This version is for testing and reviewing**'
puts ''
puts '******************************************'
# 1-enter Link of page
puts "Enter the page link 'url' to be scraped:"
link = gets.chomp
p link

# 2-enter SELECTOR of the name of product
puts 'Enter the page Direct SELECTOR of the name:'
name = gets.chomp
p name

# 3-enter  SELECTOR of the <a> link of product
puts "Enter the page Direct SELECTOR of the link 'product page':"
product_page = gets.chomp
p product_page

# 4-enter  SELECTOR of the img of product
puts 'Enter the page Direct SELECTOR of the img element:'
img = gets.chomp
p img

# 5-enter  SELECTOR of the price of product
puts 'Enter the page Direct SELECTOR of the price:'
price = gets.chomp
p price

# 6- ASK about img src to set method
end_loop = false
while end_loop == false
  puts "If the Image source is in the attr 'src' then Enter 1"
  puts "If the Image source is in the attr 'data-src', please Enter 2"
  puts "If the Image source is in a different attr 'data-src', please Enter 3"
  reply = gets.chomp
  end_loop = true if %w[1 2 3].include?(reply)
end

# ############## un-comment this for production version  ###########
# # 7- Set the method
# me = scraper.query(link)
# goods = scraper.img_in_src(me, name, product_page, img, price) if reply == '1'
# goods = scraper.img_in_data_src(me, name, product_page, img, price) if reply == '2'
# if reply == "3"
#     puts "Enter the attr name:"
#     the_other_attr = gets.chomp
#     goods = scraper.img_in_another_attr(me, name, product_page, img, price, the_other_attr)
# end
####################################################################

# ############### FOR TESTING ######################################
# 7- Set the method
me = scraper.query('https://deals.souq.com/eg-en/smart-tvs/c/15236')
name = 'h6.title a'
product_page = 'h6.title a'
img = 'a.img-link img'
price = 'h5.price span.is'
goods = scraper.img_in_data_src(me, name, product_page, img, price)
###################################################################

# 8- Display Items
display_goods(goods)


