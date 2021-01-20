require "httparty"
require "nokogiri"
require "byebug"




def scraper
    url = "https://fashion.souq.com/eg-en/fashion-best-deals/c/15693"
    original = HTTParty.get(url)
    parsed = Nokogiri::HTML(original)
    items = []
    blocks = parsed.css('div.block-grid-large') # Item cards
    blocks.each do |block|
        item = {
            name: block.css('h6.title a').text,
            url: block.css('h6.title a')[0].attributes["href"].value,
            img_src: block.css('a.img-link img')[0].attributes['data-src'].value,
            price: block.css('h5.price span.is')[0].text
        }
        
        items << item
    end
    byebug
end

scraper

p 



# parsed.css('a.img-link img')[0].attributes['data-src']

# parsed.css('h5.price span.is')[0].text

# ruby bin/scraper.rb

# item[:]