require 'csv'

data = []

CSV.foreach("72586699999.csv") do |row|
row.map{ |x| x.gsub(/[^0-9a-z ]/i, '')}
data.push row
end

p data[0]