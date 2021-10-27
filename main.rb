require 'csv'
require 'sqlite3'
require 'active_record'
require 'pry'

# Connect to an in-memory sqlite3 database
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
    create_table :joslin_fields, force: true do |t|
      t.date :capture_date
      t.float :temp
      t.float :dew_point
      t.float :pressure
      t.float :visibility
      t.float :wind_speed
      t.float :wind_max
      t.float :wind_gust
      t.float :temp_max
      t.float :temp_min
      t.float :precipitation

    end
  
  end

  class JoslinField < ActiveRecord::Base

  end

data = []

CSV.foreach("72586699999.csv") do |row|
row.map{ |x| x.gsub(/[^0-9a-z ]/i, '')}
data.push row
entry = JoslinField.create!(capture_date: row[1], temp: row[6])

end

p JoslinField.all.count
p JoslinField.find_by(capture_date: data[1])