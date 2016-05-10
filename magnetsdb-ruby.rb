require 'sqlite3'
DBNAME = "main-sqlite.db"
DB = SQLite3::Database.open( DBNAME )
puts "Enter request"
request = gets.chomp
puts "Search:"
puts request
q = "SELECT caption, category, labels, hash FROM data  WHERE caption LIKE '%#{request}%' ORDER BY caption LIMIT 20"		
puts q
results = DB.execute(q)
results.each do |row| 
	puts "Found item #{row[0]}"
	puts "in category #{row[1]}"
	puts "with labels #{row[2]}"
	puts "hash is #{row[3]}"
end
