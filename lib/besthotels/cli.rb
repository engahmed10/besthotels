class Besthotels::CLI 

    def self.call
        puts "Welcome user"
        puts "Type 'list' to list  2020 best hotels "
        puts("To leave, type 'exit'.")
        puts("What would you like to do?")
        self.menue
     end
  
     def self.menue 
         user= gets.chomp
        if user == "Yes"
         self.listhotel
         puts " Which hotel would you like to knows more about?:   "
         self.detailhotel(user)                         
         self.menue 
        elsif user.to_i.between?(1,25)
          self.detailhotel(user)
          self.menue
        elsif user == "exit"
            self.exit
        else
          self.invalid       
        end
     end
  
     def  self.exit
      "See You"
    end

     def self.invalid
         puts"invalid input ,please enter valid option"
          self.menue
      end
  
     def self.listhotel
      aa= Besthotels::Hotels.all 
      puts "\n\n"
      puts "----------------------------------------------------------------------------------------------------------------------------------------------------"
      puts "Hotel Name".colorize(:blue) + "                                  Location".colorize(:green) + "                             Website Url".colorize(:black)   
      puts " ---------------------------------------------------------------------------------------------------------------------------------------------------"       
        aa.each_with_index do |value,i|
          puts "#{i+1}. #{value.hotel.upcase}".colorize(:blue) + " | " +  "#{value.location} ".colorize(:green) + " | " +  "#{value.url} ".colorize(:black)    
          puts "-------------------------------------------------------------------------------------------------------------------------------------------------"
        end
        puts "\n\n"
    end

    def self.detailhotel(user)

       Besthotels::Hotels.find_by_rank(user).each do |i|           
            puts "\n\n"  
            puts i.hotel
            puts "\n"            
            puts "Details".colorize(:blue) 
            puts "\n"
            puts i.specific
            puts "\n\n"
            puts "Property Amenities".colorize(:blue) 
            puts "\n"
            puts i.amenities
            puts "\n\n"
            if i.contact != ""
              puts "Call Us : #{i.contact}".colorize(:blue) 
            end
            puts "\n\n"           
       end
    end

    
  
  
  end