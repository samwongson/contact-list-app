## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

# require './contact'


class ContactDatabase

  attr_accessor :contacts

  def initialize
    @contacts = CSV.read('contacts.csv')
  end

  def self.read_contacts 
    CSV.read('contacts.csv').map do |contact|
      Contact.new(contact[0], contact[1], contact[2])
    end
    # binding.pry
  end

  def self.add_contact(name, email, p={})


        CSV.open('contacts.csv', 'ab') do |csv_object|
        csv_object << [name, email, p]

      end
      
  end

  def self.id_feed(id)
    puts CSV.parse(File.read('contacts.csv'))[id+1]
  end

end 





