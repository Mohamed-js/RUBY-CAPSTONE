require 'httparty'
require 'nokogiri'
require 'byebug'
require 'colorize'

# Class Scraper
class Scraper
  def initialize; end

  def crawl(surl, sname, slink, simg_src, sprice)
    original = HTTParty.get(surl)
    parsed = Nokogiri::HTML(original)
    items = []
    blocks = parsed.css('div.block-grid-large') # Item cards
    blocks.each do |block|
      item = {
        name: block.css(sname).text.strip!,
        link: block.css(slink)[0].attributes['href'].value,
        img_src: block.css(simg_src)[0].attributes['data-src'].value,
        price: block.css(sprice)[0].text.strip!.gsub("\t", '').gsub("\n", '')
      }
      items << item
      puts "Scrapped #{item[:name]} " + 'successfully...'.green
    end
    puts '---------------------------------------------------------------'
    puts 'DONE!'.green
    items
  end
end
