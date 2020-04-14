class Besthotels::CLI 

    def self.call
        puts "Welcome , user"
        puts "Do you want to see best hotels for 2020,if Yes ,please enter: 'Yes' "
        puts "if you like to exit ,enter:'exit'"
        self.menue
     end
  
     def self.menue 
         user= gets.chomp
        if user == "Yes"
         self.listhotel
         
         
         puts "For more detalis about each hotel ,enter  hotel  ranke number  "
        
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
          puts "#{i+1}. #{value.hotel}".colorize(:blue) + " | " +  "#{value.location} ".colorize(:green) + " | " +  "#{value.url} ".colorize(:black)    
          puts "-------------------------------------------------------------------------------------------------------------------------------------------------"
          puts "#{value.specific}"
        end
        puts "\n\n"
    end
    
  
  
  end