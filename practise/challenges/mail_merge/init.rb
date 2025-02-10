require 'erb'
require 'csv'

APP_ROOT = File.expand_path(File.dirname(__FILE__))
template_path = File.join(APP_ROOT, 'overdue_notice.txt.erb')
csv_path = File.join(APP_ROOT, 'overdue_list.csv')
output_dir = File.join(APP_ROOT, 'letters')

def number_to_currency(value)
  sprintf('$%.2f', value.to_f)
end

# Reading the template
template = File.read(template_path)

# Reading the csv
i = 0
CSV.foreach(csv_path, headers: true) do |row|
  i += 1

  # instance variables (gets stored in the binding of the global space)
  @last_name = row['Last Name']
  @first_name = row['First Name']
  @days = row['Days'].to_i
  @title = row['Title']
  @fee = number_to_currency(@days * 0.25) # 0.25 per day

  letter = ERB.new(template).result(binding)
  num = i < 10 ? "0#{i}" : i

  file_name = "overdue_#{num}.txt"
  file_path = File.join(output_dir, file_name)

  File.write(file_path, letter)
end