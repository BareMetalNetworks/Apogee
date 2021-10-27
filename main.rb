require 'csv'
require 'sqlite3'
require 'active_record'


# Connect to an in-memory sqlite3 database
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
    create_table :joslin_field, force: true do |t|
      t.string :station
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
#entry = JoslinField.create!()
end

p data[0]