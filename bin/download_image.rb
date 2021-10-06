require "open-uri"
require 'csv'

all_table = CSV.parse(File.read("cosmo.csv"), headers: true)


# all_table.each do |row|
#     url = row['image']
#     p url.split('/')[5..7].join('/')
#     # File.open('images/1.png', 'wb') do |f|
#     #     f.write open("https://res.cloudinary.com/atefcloud/image/upload/v1/agz5anty/d8f5d87731a4342c0b08f3d02ae3d99c.jpg").read 
#     # end
# end

10.times do |i|
    url = all_table[i]['image']
    img_name = url.split('/')[5..7].join('/')
    img_name_new = url.split('/')[5..7].join
    File.open("images/#{img_name_new}", 'wb') do |f|
        f.write open("https://www.yodawy.com/wp-content/uploads/#{img_name}").read 
    end
end