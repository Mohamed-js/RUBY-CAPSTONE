require 'nokogiri'
require 'httparty'
require 'colorize'

# Class Scraper
class Scraper
  def initialize; end

  def query(original)
    # original = HTTParty.get(surl)
    parsed = Nokogiri::HTML(original)
    parsed.css('div.products section.product') # Item cards
  end

  def img_in_src(blocks)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
      cat = block.attributes['class'].value.split[5].slice(12..-1)
      item = {
        name: block.css('.product-wrapper .meta-wrapper h3.heading-title').text,
        image_data: block.css('.product-wrapper .thumbnail-wrapper img')[0].attributes['src'].value,
        category: 'skin care',
        sub_category: 'facial care',
        sub_category_id: 10
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
