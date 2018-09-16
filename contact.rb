class Contact

@@list = []
@@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

#Reader

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  def self.list
    @@list
  end



#Writer

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@list << new_contact
    return new_contact

  end

  # This method should return all of the existing contacts
  def self.all
    @@list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id_number)
    @@list.each do |contact|
      if contact.id == id_number
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
  self.send("#{attribute}=", value)
end




  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

#How do i select a instance variable from a instance



  def self.find_by(attribute, value)
    @@list.each do |contact|
      if contact.send(attribute) == value
        return contact
      end
      puts "cant find"
      return nil
    end
  end
#
# if contact."first_name"
#   if contact.first_name


  #   @@list.each do |contact|
  #     if contact.first_name == find_first_name
  #       return contact
  #     end
  #   end
  # end

  # This method should delete all of the contacts
  def self.delete_all
    @@list.clear
  end

  def full_name
    puts "#{first_name} #{ last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete()
    @@list.delete(self)
  end

end

  # Feel free to add other methods here, if you need them.





contact1 = Contact.create("Dan", "Ang", "dan@gmail.com", "no")
contact2 = Contact.create("Molly", "Wei", "dan@gmail.com", "no")

# contact1.delete(contact1)
# puts Contact.all.inspect


# puts contact1.update("first_name", "toby" )
# puts contact1.first_name
# puts contact1.inspect

# contact1.first_name = "george"
# puts contact1.inspect
#
# puts Contact.list.inspect

# # puts Contact.all.inspect
#
# # puts Contact.find(2).inspect
#
