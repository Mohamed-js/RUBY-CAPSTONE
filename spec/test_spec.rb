require '../lib/scraper_class.rb'

# Variables for testing
link = 'https://deals.souq.com/eg-en/smart-tvs/c/15236'
name = 'h6.title a'
product_page = 'h6.title a'
img = 'a.img-link img'
price = 'h5.price span.is'
scraper = Scraper.new
query = scraper.query(link)
data = scraper.img_in_data_src(query, name, product_page, img, price)

describe Scraper do
  # 1- Test Query Method
  describe '#query' do
    # Check if an object
    it 'should return true' do
      expect(query).to be_kind_of(Object)
    end

    # 2- Check if returns a Nokogiri object
    it 'the elememt parent class should be a Nokogori NodeSet' do
      type1 = Nokogiri::XML::NodeSet
      type2 = query.class.ancestors[0]
      expect(type2).to eql(type1)
    end
  end

  # 3- Test img_in_src Method
  describe '#img_in_src' do
    # The result type
    it 'should return an array' do
      expect(data).to be_a Array
    end

    # 4- Check the content != empty
    it "shouldn't be empty" do
      expect(data.size).to be > 0
    end
  end
end
