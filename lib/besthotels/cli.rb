class Besthotels::CLI 

    def self.call
        puts "Welcome user"
        puts "Type 'list' to list  2020 best hotels "
        puts("To leave, type 'exit'.")
        puts("What would you like to do?")
        Besthotels::Scraper.make_hotel 
        Besthotels::Scraper.add_more_attr                  
        self.menue
     end
  
     def self.menue 
         user= gets.chomp
         
        if user == "list"
           self.listhotel
         puts " Which hotel would you like to knows more about? ,type rank of hotel:"
           user= gets.chomp
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
        aa.each_with_index do |hotel,i|
          puts "#{i+1}. #{hotel.name.upcase}".colorize(:blue) + " | " +  "#{hotel.location} ".colorize(:green) + " | " +  "#{hotel.url} ".colorize(:black)    
          puts "-------------------------------------------------------------------------------------------------------------------------------------------------"
        end
        puts "\n\n"
        
    end

    def self.detailhotel(user)

      # Besthotels::Hotels.find_by_rank(user).each do |i| 
   
     #hotelobj = Besthotels::Hotels.all[user.to_i-1]   
     #Besthotels::Hotels.pass_object(i)  
     
     #binding.pry

     hotelobjarry = Besthotels::Hotels.find_by_rank(user)
     Besthotels::Scraper.get_info_of_each(hotelobjarry[0])    #because it  returns array 

            puts "\n\n"  
            puts hotelobjarry[0].name
            puts "\n"            
            puts "Details".colorize(:blue) 
            puts "\n"
            if hotelobjarry[0].specific != ""
              puts hotelobjarry[0].specific
            end
            puts "\n\n"
            puts "Property Amenities".colorize(:blue) 
            puts "\n"
            if hotelobjarry[0].amenities != ""
               puts hotelobjarry[0].amenities
            end
            puts "\n\n"
            if hotelobjarry[0].contact != ""
              puts "Call Us : #{hotelobjarry[0].contact}".colorize(:blue) 
            end
            puts "\n\n"  
            puts "quotes of reviewer".colorize(:blue) 
            puts "\n" 
            puts hotelobjarry[0].quotes

    end

  end