#!/usr/bin/env ruby
require 'csv'
require_relative '../lib/shein_scraper_class'

scraper = Scraper.new

links = ["https://www.shein.com/Men-Clothing-c-2026.html"]

links.each_with_index do |link, i|
    page = scraper.query(link)
    drugs = scraper.img_in_src(page)

    # Write the results
    CSV.open("shein.csv", "a") do |csv|
        120.times do |i|
            drug = drugs[i]
            csv << [drug[:id], drug[:cat_id], drug[:name], drug[:us_price], drug[:img], drug[:link]]
        end
    end
end
