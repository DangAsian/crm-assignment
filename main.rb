require_relative 'contact.rb'

Contact.create("Daniel", "Ang", "dan.justin.ang@gmail.com", "This person is asian")
puts Contact.list.inspect
