require 'csv'
 
faecher = Array.new( 15, 0 )

CSV.open('versuch_01_galtonbrett-messung_01.csv', 'r', ',') do |row|
  next if row[0] == 'Messung'
  puts row.inspect
  (1..14).each {|fach| faecher[fach] += row[fach].to_i }
end

summ = 0
(1..14).each {|fach| summ += faecher[fach]}
puts summ / 1000
