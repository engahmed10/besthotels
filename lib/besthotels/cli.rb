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
         user= gets.chomp
         Besthotels::Hotels.find_by_rank(user)                            
         self.menue 
        elsif user.between?(1,25)
          Besthotels::Hotels.find_by_rank(user) 
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
      puts "Hotel Name".colorize(:blue) + "                                  Location".colorize(:green) + "                             Website Name".colorize(:black)   
      puts " ---------------------------------------------------------------------------------------------------------------------------------------------------"       
        aa.each_with_index do |value,i|
          puts "#{i+1}. #{value.hotel.upcase}".colorize(:blue) + " | " +  "#{value.location} ".colorize(:green) + " | " +  "#{value.url} ".colorize(:black)    
          puts "-------------------------------------------------------------------------------------------------------------------------------------------------"
        end
        puts "\n\n"
    end

    
  
  
  end