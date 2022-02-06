require 'nokogiri'
require 'httparty'
require 'colorize'
require 'watir'
require 'webdrivers'

# Class Scraper
class Scraper
  def initialize; end

  def query(original)
    browser = Watir::Browser.new
    browser.goto original
    # Wait until images load!
    puts 'Started ......'.yellow
    # browser = HTTParty.get(original)
    sleep(2)
    browser.scroll.to :top 
    sleep 3
    browser.scroll.to :bottom 
    sleep(5)
    parsed = Nokogiri::HTML.parse(browser.html)
    parsed.css('.S-product-item')
  end

  def img_in_src(blocks)
    puts 'Wait seconds ......'.yellow
    items = []
    blocks.each do |block|
        p"-===========-===========-==========-"
        p block.css('.S-product-item__price .S-product-item__retail-price').text.split("US$")
      item = {
          id: block.css('.S-product-item__link.S-product-item__link_jump')[0].attributes['href'].value.split("-p-")[1].split("-cat-")[0],
          cat_id: block.css('.S-product-item__link.S-product-item__link_jump')[0].attributes['href'].value.split("-p-")[1].split("-cat-")[1].split('.html')[0],
          name: block.css('.S-product-item__img-container')[0].attributes["aria-label"].value,
          img: block.css('.S-product-item__img-container')[0].children[0].attributes['data-src'].value.slice(2..-1),
          link: "https://www.shein.com/" + block.css('.S-product-item__img-container')[0].attributes["href"].value,
          us_price: block.css('.S-product-item__price .S-product-item__retail-price').text.split("US$")[1].strip!,
      }
      items << item
    #   puts "Scrapped #{item[:name]} " + 'successfully...'.green
    end
    puts '---------------------------------------------------------------'
    puts 'DONE!'.green
    items
  end
end

