class Add_book
  attr_accessor :conlist

  def initialize
    @conlist = Array.new
  end

  def addcontacts(addbook)
    c = Contact.new
    puts "Enter First Name: "
    c.firstname = gets.chomp!
    puts "Enter Middle Name: "
    c.middlename = gets.chomp!
    puts "Enter Last Name: "
    c.lastname = gets.chomp!
    a = Address.new
    puts "Enter Street: "
    a.street = gets.chomp!
    puts "Enter City: "
    a.city = gets.chomp!
    puts "Enter State: "
    a.state = gets.chomp!
    puts "Enter Zipcode: "
    a.zipcode = gets.chomp!
    c.add = a
    addbook.conlist.push(c)
    puts "Contact added successfully."
  end

  def editcontacts(addbook)
    if conlist.length == 0
      puts "No contacts in Address book. So cannot edit a contact."
    else
      puts "Enter Contact ID to edit: "
      id = gets.chomp!.to_i
      field = ''
      if id < conlist.length
        until field=="firstname" || field=="middlename" || field=="lastname" || field=="street" || field=="city" || field=="state" || field=="zipcode"
          puts "Fields are as follows: "
          puts "firstname | middlename | lastname | street | city | state | zipcode"
          puts "Enter correct field to edit: "
          field = gets.chomp!
        end
        puts "Enter the new value: "
        value = gets.chomp!
        addbook.edit(id,field,value)
        puts "Contact edited successfully."
      else
        puts "No contact exists with id #{id}. Please enter correct contact id."
      end
    end
  end

  def deletecontact(addbook)
    if conlist.length == 0
      puts "No contacts in address book. So delete operation is not appicable."
    else
      puts "Enter the contact id to delete"
      id = gets.chomp!.to_i
      addbook.delete(id)
    end
  end

  def searchcontacts(addbook)
    if conlist.length == 0
      puts "No contacts in address book to search."
    else
      choice=0
      until choice==1 || choice==2 || choice==3 || choice==4
        puts "Search by.."
        puts "1. Id"
        puts "2. Firstname"
        puts "3. Lastname"
        puts "4. City"
        puts "Enter your choice of search: "
        choice = gets.chomp!.to_i
        value = ""
        case choice
        when 1
          puts "Enter Id to search: "
          value = gets.chomp!.to_i
          if value < conlist.length
            conlist.each_with_index do |item, val|
              if value == val
                puts "Searched Contact"
                # puts "-----------------"
                # puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
                # puts "---------------------------------------------------------------------------"
                puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
              end
            end
          else
            puts "No contact found with contact id #{value}"
          end
        when 2
          puts "Enter Firstname to search: "
          value = gets.chomp!
          count = 1
          conlist.each_with_index do |item, val|
            if item.firstname == value
              puts "Searched Contact #{count}"
              # puts "-----------------"
              # puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
              # puts "---------------------------------------------------------------------------"
              puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
              count += 1
            end
          end
          if count == 1
            puts "No contact found with firstname #{value}"
          end
        when 3
          puts "Enter Lastname to search: "
          value = gets.chomp!
          count = 1
          conlist.each_with_index do |item, val|
            if item.lastname == value
              puts "Searched Contact #{count}"
              # puts "-----------------"
              # puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
              # puts "---------------------------------------------------------------------------"
              puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
              count += 1
            end
          end
          if count == 1
            puts "No contact found with lastname #{value}"
          end
        when 4
          puts "Enter City to search: "
          value = gets.chomp!
          count = 1
          conlist.each_with_index do |item, val|
            if item.add.city == value
              puts "Searched Contact #{count}"
              # puts "-----------------"
              # puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
              # puts "---------------------------------------------------------------------------"
              puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
              count += 1
            end
          end
          if count == 1
            puts "No contact found with city #{value}"
          end
        else
          puts "Enter Correct Search Choice: "
        end
      end
    end
  end

  def edit(id, field, value)
    conlist.each_with_index do |item, val|
      if(val == id)
        case field
        when "firstname"
          item.firstname = value
        when "lastname"
          item.lastname = value
        when "middlename"
          item.middlename = value
        when "street"
          item.add.street = value
        when "city"
          item.add.city = value
        when "state"
          item.add.state = value
        when "zipcode"
          item.add.zipcode = value
        end
      end
    end
  end

  def sortedcontacts(addbook)
    if conlist.length !=0
      temp = conlist
      temp.sort!{ |a,b| ((a.firstname == b.firstname) ? a.lastname <=> b.lastname : a.firstname <=> b.firstname) }
      puts "Sorted Contacts list on Firstname and Lastname: "
      puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
      puts "---------------------------------------------------------------------------"
      temp.each_with_index do |item, val|
        puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
      end
    elsif conlist.length == 0
      puts "No contacts in Addressbook to sort."
    end
  end

  def delete(id)
    if id < conlist.length
      conlist.delete_at(id)
      puts "Contact deleted successfully"
    else
      puts "Contact with ID #{id} doesnot exist. Please choose correct contact Id."
    end
  end

  def printcontacts(addbook)
    addbook.to_s
  end


  def to_s
    if conlist.length != 0
      puts "Contacts in ADDRESS BOOK: "
      puts "--------------------------"
      puts "ID | First Name | Middle Name | Last Name | Street | City | State | Zipcode"
      puts "---------------------------------------------------------------------------"
      conlist.each_with_index do |item, val|
        puts "#{val} |#{item.firstname} | #{item.middlename} | #{item.lastname} | #{item.add.street} | #{item.add.city} | #{item.add.state} | #{item.add.zipcode}"
      end
    else
      puts "No contacts to display"
    end
  end
end