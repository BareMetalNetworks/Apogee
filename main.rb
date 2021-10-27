
array = File.read("72586699999.csv").split(",").map(&:strip).map{ |x| x.gsub(/[^0-9a-z ]/i, '')}

p array