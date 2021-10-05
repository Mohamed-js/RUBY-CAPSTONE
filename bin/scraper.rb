#!/usr/bin/env ruby
require 'csv'
require_relative '../lib/scraper_class'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new


# Hair
links = [['https://www.yodawy.com/shop/hair-care/conditioner/?per_page=200',"Conditioner"], ['https://www.yodawy.com/shop/hair-care/hair-styling/?per_page=200',"Hair Styling"], ['https://www.yodawy.com/shop/hair-care/hair-gel/?per_page=200',"Hair Care"], ['https://www.yodawy.com/shop/hair-care/shampoo/?per_page=200',"Shampoo"], ['https://www.yodawy.com/shop/hair-care/hair-dyes/?per_page=200',"Hair Dye"], ['https://www.yodawy.com/shop/hair-care/anti-hair-loss/?per_page=200',"Hair Loss"], ['https://www.yodawy.com/shop/hair-care/hair-treatments/?per_page=200',"Hair Treatment"]]

# Skin
# links = ['https://www.yodawy.com/ar/shop/beauty/nail-care/?per_page=200','https://www.yodawy.com/ar/shop/beauty/skin-care/?per_page=200','https://www.yodawy.com/ar/shop/beauty/lip-care/?per_page=200','https://www.yodawy.com/ar/shop/beauty/facial-care/?per_page=200','https://www.yodawy.com/ar/shop/beauty/suncare/?per_page=200','https://www.yodawy.com/ar/shop/beauty/skin-whitening/?per_page=200','https://www.yodawy.com/ar/shop/beauty/acne-treatment/?per_page=200','https://www.yodawy.com/ar/shop/beauty/makeup/?per_page=200',]

# Men Care
# links = ['https://www.yodawy.com/ar/shop/men-care/?per_page=200', 'https://www.yodawy.com/ar/shop/men-care/page/2/?per_page=200']

# Baby
# links = ['https://www.yodawy.com/ar/shop/baby/page/1/?per_page=200','https://www.yodawy.com/ar/shop/baby/page/2/?per_page=200','https://www.yodawy.com/ar/shop/baby/page/3/?per_page=200','https://www.yodawy.com/ar/shop/baby/page/4/?per_page=200','https://www.yodawy.com/ar/shop/baby/page/5/?per_page=200','https://www.yodawy.com/ar/shop/baby/page/6/?per_page=200',]

# Women Care
# links = ['https://www.yodawy.com/ar/shop/women-care/hair-removal/?per_page=200','https://www.yodawy.com/ar/shop/women-care/panty-liners/?per_page=200','https://www.yodawy.com/ar/shop/women-care/sanitary-pads/?per_page=200','https://www.yodawy.com/ar/shop/women-care/womens-deodorants/?per_page=200','https://www.yodawy.com/ar/shop/women-care/woman-shavers/?per_page=200','https://www.yodawy.com/ar/shop/women-care/body-splash-mist/?per_page=200']

# Sexual
# links = ['https://www.yodawy.com/ar/shop/sexual-wellness/?per_page=200']

# 1-enter Link of page
# puts '1- Enter the product page link to be scraped :'
# link = gets.chomp



links.each_with_index do |link, i|
    page = scraper.query(link[0])
    drugs = scraper.img_in_src(page,'Hair Care',link[1], i+1)

    # Write the results
    CSV.open("cosmo.csv", "a") do |csv|
        drugs.each do |drug|
            csv << [drug[:name], drug[:image_data], drug[:category], drug[:sub_category], drug[:cosm_cat_id]]
        end
    end
end
