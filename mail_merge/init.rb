#!/usr/bin/env ruby

APP_ROOT = File.expand_path(File.dirname(__FILE__))

def number_to_currency(value)
  sprintf('$%.2f', value.to_f)
end


# Read template file containing the overdue notice

# Read CSV file to get list of overdue notices

# For each notice:

# Set instance variables as needed

# Use ERB to bind instance variables to the letter template

# Save results as separate files (e.g., "letters/overdue_01.txt")
