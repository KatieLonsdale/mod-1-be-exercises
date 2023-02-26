class Attendee
  attr_reader :id, :name, :zipcode

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @name = format_name(first_name, last_name)
    @zipcode = clean_zip(zipcode)
  end

  def format_name(first, last)
    "#{first} #{last}"
  end

  def display
    "#{@id}: #{@name}, #{@zipcode}"
  end

  def clean_zip(zipcode)
    zipcode.to_s.rjust(5,'0')[0..4]
  end
end