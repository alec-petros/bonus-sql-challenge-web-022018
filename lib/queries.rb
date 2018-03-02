# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  sql = <<-SQL
    SELECT name FROM guests GROUP BY name ORDER BY count(name) DESC LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

# can't get years to display in order
def most_popular_profession_by_year
  sql = <<-SQL
    SELECT year, occupation FROM guests GROUP BY year, occupation ORDER BY count(occupation) DESC
  SQL
  DB[:conn].execute(sql)
end

def most_popular_profession
  sql = <<-SQL
    SELECT occupation FROM guests GROUP BY occupation ORDER BY count(occupation) DESC LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def pat_stewart_dates
  sql = <<-SQL
    SELECT show FROM guests GROUP BY name HAVING name = "Patrick Stewart"
  SQL
  DB[:conn].execute(sql)
end

def how_many_bills
  sql = <<-SQL
    SELECT COUNT(DISTINCT name) FROM guests WHERE name LIKE "Bill%"
  SQL
  DB[:conn].execute(sql)
end

def year_with_most_guests
  sql = <<-SQL
    SELECT year FROM guests GROUP BY year ORDER BY count(name) DESC LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

# can't get years to display in order
def most_popular_group_per_year
  sql = <<-SQL
    -- SELECT year, category FROM guests GROUP BY year, category ORDER BY count(category), year DESC
    SELECT DISTINCT year, category, count(category) FROM guests GROUP BY year, category ORDER BY count(category) DESC
  SQL
  DB[:conn].execute(sql)
end
