module NumberHelper
  
  # Simple method to format a number as $ currency
  # Examples:
  #   1000 => $1000.00
  #   123.4 => $123.40
  def number_to_currency(value)
    sprintf('$%.2f', value.to_f)
  end
  
end
