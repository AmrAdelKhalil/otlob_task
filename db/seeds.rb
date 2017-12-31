require 'csv'

path_name = File.join(Rails.root, 'db', 'Sacramentorealestatetransactions.csv')

data_file = File.read(path_name)

parsed_data = CSV.parse(data_file, :headers => true)

parsed_data.each do |row|
  Estate.create!(
    street: row[0],
    city: row[1],
    zip: row[2],
    state: row[3],
    beds: row[4],
    baths: row[5],
    sq_ft: row[6],
    estate_type: row[7],
    sale_date: row[8],
    price: row[9],
    latitude: row[10],
    longitude: row[11]
  )
end
