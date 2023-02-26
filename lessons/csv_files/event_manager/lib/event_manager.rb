# ./lib/event_manager.rb
require "csv"

class EventManager
  attr_reader :file, :attendees

  def initialize(file_path)
    @file = file_path
    @attendees = []
  end

  def access_column(header)
    contents = open_file
    contents.map do |row|
      row[header]
    end
  end

  def open_file
    CSV.open @file, headers: true, header_converters: :symbol
  end

  def create_attendees
    attendees = open_file
    @attendees = attendees.map do |attendee|
      Attendee.new(attendee[:id], attendee[:first_name], 
      attendee[:last_name], attendee[:zipcode])
    end
  end

  def display_attendees
    @attendees.map{|attendee| "#{@id}: #{@name}, #{@zipcode}"}
  end
end

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,'0')[0..4]
# end

# puts "EventManager initialized."

# contents = CSV.open './data/event_attendees.csv', headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = clean_zipcode(row[:zipcode])
#   puts "#{name} #{zipcode}"
# end

# contents = File.read './data/event_attendees.csv'
# puts contents

# lines = File.readlines './data/event_attendees.csv'
# row_index = 0
# lines.each_with_index do |line,index|
#   next if row_index == 0
#   columns = line.split(',')
#   name = columns[2]
#   puts name
# end