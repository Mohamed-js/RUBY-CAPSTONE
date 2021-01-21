require 'nokogiri'
require 'httparty'
require 'byebug'
require 'colorize'

# Class Scraper
class Scraper
  def initialize; end

  def query(surl)
    original = HTTParty.get(surl)
    parsed = Nokogiri::HTML(original)
    blocks = parsed.css('div.block-grid-large') # Item cards
    blocks
  end

  def img_in_another_attr(blocks, name, link, img_src, price, att2r)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
      item = {
        name: block.css(name).text.strip!,
        link: block.css(link)[0].attributes['href'].value,
        img_src: block.css(img_src)[0].attributes[att2r].value,
        price: block.css(price)[0].text.strip!.gsub("\t", '').gsub("\n", '')
      }
      items << item
      puts "Scrapped #{item[:name]} " + 'successfully...'.green
    end

    puts '---------------------------------------------------------------'
    puts 'DONE!'.green
    items
  end

  def img_in_data_src(blocks, name, link, img_src, price)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
      item = {
        name: block.css(name).text.strip!,
        link: block.css(link)[0].attributes['href'].value,
        img_src: block.css(img_src)[0].attributes['data-src'].value,
        price: block.css(price)[0].text.strip!.gsub("\t", '').gsub("\n", '')
      }
      items << item
      puts "Scrapped #{item[:name]} " + 'successfully...'.green
    end

    puts '---------------------------------------------------------------'
    puts 'DONE!'.green
    items
  end

  def img_in_src(blocks, name, link, img_src, price)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
      item = {
        name: block.css(name).text.strip!,
        link: block.css(link)[0].attributes['href'].value,
        img_src: block.css(img_src)[0].attributes['src'].value,
        price: block.css(price)[0].text.strip!.gsub("\t", '').gsub("\n", '')
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
