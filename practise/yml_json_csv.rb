
require 'json'
require 'yaml'
require 'csv'

this_dir = File.expand_path(File.dirname(__FILE__))
data_dir = File.join(this_dir, 'data')
json_file = File.join(data_dir, 'us_presidents.json')
yaml_file = File.join(data_dir, 'us_presidents.yml')
csv_file = File.join(data_dir, 'us_presidents.csv')

json = File.read(json_file) # in json format
data = JSON.parse(json)

presidents = data['us_presidents']

early_presidents = presidents[0..9]

new_data = {'early_us_presidents' => early_presidents}

# json = JSON.generate(new_data)
json = new_data.to_json

new_json_file = File.join(data_dir, 'early_us_presidents.json')
File.write(new_json_file, json)


yaml = File.read(yaml_file)
data = YAML.load(yaml)

new_yaml_file = File.join(data_dir, 'early_us_presidents.yml')
File.write(new_yaml_file, yaml)

CSV.foreach(csv_file, headers: true) do |row|
  puts row["Last Name"]
end

csv_presidents = CSV.read(csv_file)
headers = csv_presidents.shift
early_presidents = csv_presidents[0..9]

new_csv_file = File.join(data_dir, 'early_us_presidents.csv')

CSV.open(new_csv_file, 'w') do |csv|
  csv << headers
  early_presidents.each do |array|
    csv << array
  end
end