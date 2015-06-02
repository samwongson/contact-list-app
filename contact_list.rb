require_relative 'contact'
require_relative 'contact_database'


def help
 puts "Here is a list of available commands: 
    new  - Create a new contact 
    list - List all contacts
    show - Show a contact
    find - Find a contact"
end

user_answer = ARGV.first

  case user_answer
    when help 
      help
    when /new/

    when list
      puts ContactDatabase.read_contacts
    when show
      puts "nothing"
    when find
      puts "nothing"
    else
      return
    end

