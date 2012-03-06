#!/bin/env ruby

require 'csv'

# Kugeln in den Faechern summieren
faecher = Array.new( 15, 0 )
CSV.open('versuch_01_galtonbrett-messung_01.csv', 'r', ',') do |row|
  next if row[0] == 'Messung'
  (1..15).each {|fach| faecher[fach - 1] += row[fach].to_i }
end
puts faecher.inspect
puts

ANZAHL_MESSUNGEN = 1000.0

#####
#  FACHNUMMERN
#####

# Durchschnitt der Fachnummern
summ = 0
(0..14).each { |fach| summ += (fach + 1) * faecher[fach] }
durchschnitt = summ / ANZAHL_MESSUNGEN
puts "Durchschnitt der Fachnummern: " + durchschnitt.to_s


# Standardabweichung der Fachnummern
summ = 0
(0..14).each { |fach| summ += faecher[fach] * ( (fach + 1) - durchschnitt )**2 }
standardabweichung = Math.sqrt(summ) / Math.sqrt(ANZAHL_MESSUNGEN - 1)
puts "Standardabweichung der Fachnummern: " + standardabweichung.to_s

# Standardabweichung des Durchschnitts
standardabweichung_durchschnitt = Math.sqrt(summ) / Math.sqrt( ANZAHL_MESSUNGEN * (ANZAHL_MESSUNGEN - 1) )
puts "Standardabweichung des Durchschnitts: " + standardabweichung_durchschnitt.to_s


#####
# Belegung
#####


