require './address'
require './contact'
require './address_book'

addbook = Add_book.new

loop do
  puts "---------------------"
  puts "Menu"
  puts "---------------------"
  puts "1. Add Contact"
  puts "2. Edit Contact"
  puts "3. Delete Contact"
  puts "4. Print Contacts"
  puts "5. Search Contacts"
  puts "6. Sorted Contacts list"
  puts "7. Exit"
  puts "---------------------"
  puts "Enter your choice: "
  choice = gets.chomp!.to_i
  case choice
  when 1
    addbook.addcontacts(addbook)
  when 2
    addbook.editcontacts(addbook)
  when 3
    addbook.deletecontact(addbook)
  when 4
    addbook.printcontacts(addbook)
  when 5
    addbook.searchcontacts(addbook)
  when 6
    addbook.sortedcontacts(addbook)
  when 7
    puts "You chose to Exit."
    exit(0)
  else
    puts "Choose correct choice"
  end
end