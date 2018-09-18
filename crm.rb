require_relative 'contact.rb'

class CRM


  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  # def select_attribute
  #   puts 'Select the following attribute'
  #   puts '[1] First Name'
  #   puts '[2] Last Name'
  #   puts '[3] e-mail'
  #   puts '[4] Note'
  #   puts '[5] Exit'
  #   puts 'Enter a number: '
  # end

  def call_option(user_selected)
   case user_selected
   when 1 then add_new_contact
   when 2 then modify_existing_contact
   when 3 then delete_contact
   when 4 then display_all_contacts
   when 5 then search_by_attribute
   when 6 then exit
   end
  end

  # def modify_option(attribute)
  #  case attribute
  #  when 1 then first_nam
  #  when 2 then modify_existing_contact
  #  when 3 then delete_contact
  #  when 4 then display_all_contacts
  #  when 5 then search_by_attribute
  #  when 6 then exit
  #  end
  # end

#Adding a new contactputs '[5] Search by attribute'
  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    new_contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note)
  end


  def modify_existing_contact
    print 'Enter ID number'
    id_number = gets.chomp.to_i
    new_contact = Contact.find(id_number)
    # select_attribute
    puts "What would you like to change?"
    new_attribute = gets.chomp
    puts "What would you like to change this attribute to"
    new_value = gets.chomp
    new_contact.update(new_attribute => new_value)
    # modify_option(attribute)
  end

  def delete_contact
    print 'Enter ID number'
    id_number = gets.chomp.to_i
    new_contact = Contact.find(id_number)
    new_contact.delete
  end



  def display_all_contacts
    local_variable_list = Contact.all

    local_variable_list.each do |number|
    puts "First Name: #{number.first_name}  Last Name: #{ number.last_name}  Email: #{number.email} \s Note: #{number.note} ID: #{number.id}"
    # number.last_name number.email number.note
    end
  end

  def search_by_attribute

    puts "What attribute do you want to search for"
    attribute = gets.chomp
    puts "Please input the #{attribute}"
    value = gets.chomp
    begin contact = Contact.find_by(attribute => value)
    puts "First Name: #{contact.first_name}  Last Name: #{ contact.last_name}  Email: #{contact.email} \s Note: #{contact.note} ID: #{contact.id}"
    rescue
    puts "nope"
  end
end



end

at_exit do
  ActiveRecord::Base.connection.close
end

newcrm = CRM.new()
newcrm.main_menu


# Contact.create(first_name: "Daniel")
# puts Contact.all.inspect
# user = Contact.find_by(first_name: "Daniel")
# user.delete
# puts Contact.all.inspect
