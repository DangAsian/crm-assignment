gem 'activerecord', '=4.2.10' #instructs our program that if we have more than 1 version that we will use this version
require 'active_record'
require 'mini_record'

#ActiveRecord will allow you to use different adapters
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord:: Base

field :first_name, as: :string
field :last_name, as: :string
field :email, as: :string
field :note, as: :text


  def full_name
    puts "#{first_name} #{ last_name}"
  end
end


Contact.auto_upgrade!
