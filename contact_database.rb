## TODO: Implement CSV reading/writing
require 'csv'





class ContactDatabase

  attr_accessor :contacts

  def initialize
    @contacts = CSV.read('contacts.csv')
  end

  def self.read_contacts 
    CSV.read('contacts.csv')
  end

  def self.add_contact(name, email)
        CSV.open('contacts.csv', 'ab') do |csv_object|
        csv_object << [name, email]
      end
  end

  def self.id_feed(id)
    CSV.parse(File.read('contacts.csv'))[id+1]
  end

end 





