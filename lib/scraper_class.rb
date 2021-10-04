require 'nokogiri'
require 'httparty'
require 'colorize'
require 'watir'

# Class Scraper
class Scraper
  def initialize; end

  def query(original)
    browser = Watir::Browser.new
    browser.goto original
    # Wait until images load!
    sleep(10)
    parsed = Nokogiri::HTML.parse(browser.html)
    parsed.css('div.products section.product')
  end

  def img_in_src(blocks, cat, sub_cat, sub_cat_id)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
      item = {
        name: block.css('.product-wrapper .meta-wrapper h3.heading-title').text,
        image_data: block.css('.product-wrapper .thumbnail-wrapper img')[0].attributes['src'].value,
        category: cat,
        sub_category: sub_cat,
        sub_category_id: sub_cat_id
      }
      items << item
      puts "Scrapped #{item[:name]} " + 'successfully...'.green
    end

    puts '---------------------------------------------------------------'
    puts 'DONE!'.green
    items
  end
end

def display_goods(goods)
  goods.each do |good|
    puts ' ------------- '
    puts 'Name    :: '.yellow + (good[:name]).to_s
    puts 'Price   :: '.yellow + (good[:price]).to_s
    puts 'Img-src :: '.yellow + (good[:img_src]).to_s
    puts 'Product :: '.yellow + (good[:link]).to_s
  end
  puts 'Successfully done...'.green
end
