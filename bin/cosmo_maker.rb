require 'csv'

cosmetics = []

en_table = CSV.parse(File.read("cosmo en.csv"), headers: true)
ar_table = CSV.parse(File.read("cosmo ar.csv"), headers: true)


    en_table.each do |en|
        next if en['image'] == 'https://www.yodawy.com/wp-content/uploads/woocommerce-placeholder.png' || en['image'] == 'https://www.yodawy.com/wp-content/themes/mymedi/images/prod_loading.gif'
        found = false
        ar_table.each do |ar|
            if en['image'] == ar['image']
                cosmetics.push({
                    name: en['name'],
                    ar_name: ar['name'],
                    image: en['image'],
                    category: en['category'],
                    sub_category: en['sub_category'],
                    sub_category_id: en['sub_category_id']
                })
            end
        end
    end


cosmetics


CSV.open("cosmo.csv", "a") do |csv|
    cosmetics.each do |drug|
        csv << [drug[:name], drug[:ar_name], drug[:image], drug[:category], drug[:sub_category], drug[:sub_category_id]]
    end
end