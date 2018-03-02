# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'csv'
require_relative '../config/environment.rb'
require "pry"
require_relative '../lib/queries.rb'

def reset_table
  sql = <<-SQL
    DROP TABLE IF EXISTS guests; CREATE TABLE guests(id INTEGER PRIMARY KEY, name TEXT, category TEXT, show TEXT, occupation TEXT, year INTEGER)
  SQL
  DB[:conn].execute_batch(sql)
end

def show_table
  sql = <<-SQL
  SELECT * FROM guests
  SQL
  DB[:conn].execute(sql)
end

output = []
CSV.foreach("./daily_show_guests.csv") do |guest|
  output << guest
end

output.shift

reset_table

output.each do |guest|
  sql = <<-SQL
    INSERT INTO guests (name, category, show, occupation, year) VALUES (?, ?, ?, ?, ?)
  SQL
  DB[:conn].execute(sql, guest[4], guest[3], guest[2], guest[1], guest[0])
end

binding.pry
puts "hello"
