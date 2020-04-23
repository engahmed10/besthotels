class Besthotels::CLI 

    def call
        puts "Welcome user"
        puts "Type 'list' to list  2020's best hotels . "
        puts "Type any numbers between (1 ... 25) to see details of each hotel arranged by rank ."
        puts "To exit, type 'exit' or hit other keys to see more ."
        puts "To see a customers review , Type customer's name ."
        puts "What would you like to do?" 
        Besthotels::Hotels.prepare_to_list   
        menue
    end
  
    def menue 
         user= gets.chomp  
         @obj = Besthotels::Customer.find_by_name(user)         
        if user == "list"
          listhotel
          puts " Which hotel would you like to knows more about? ,type rank of hotel:"                        
          menue 
        elsif user.to_i.between?(1,25)
          detailhotel(user)
          menue
        elsif  @obj.length != 0
          customer_review
          menue     
        elsif user == "exit"
          exit
        else
          invalid       
        end
    end
  
    def  exit
      puts "See You"
    end

    def  invalid
      puts"invalid input ,please enter valid option"
      self.menue
    end
  
    def listhotel
      aa= Besthotels::Hotels.all 
      puts "\n\n"
      puts "----------------------------------------------------------------------------------------------------------------------------------------------------"
      puts "Hotel Name".colorize(:blue) + "                                  Location".colorize(:green) + "                             Website Url"   
      puts " ---------------------------------------------------------------------------------------------------------------------------------------------------"       
        aa.each_with_index do |hotel,i|
          puts "#{i+1}. #{hotel.name.upcase}".colorize(:blue) + " | " +  "#{hotel.location} ".colorize(:green) + " | " +  "#{hotel.url} "  
          puts "-------------------------------------------------------------------------------------------------------------------------------------------------"
        end
      puts "\n\n"
        
    end

    def detailhotel(user)

          hotelobjarry = Besthotels::Hotels.find_by_rank(user)
          Besthotels::Scraper.get_info_of_each(hotelobjarry[0])    
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
            puts "Contact Number: ".colorize(:blue) 
            puts "#{hotelobjarry[0].contact}"
          end
          puts "\n\n"  
          puts "Customers Name".colorize(:blue) 
          hotelobjarry[0].customers.each do |c|
            puts "\n"
            puts "#{c.name}".colorize(:red)
          end          
          hotelobjarry[0].customers.clear
          puts "To see a review of each customer, Type customer's name shown above, or hit other keys for other events."
    end

    def  customer_review
      puts "\n"
      puts "#{@obj[0].name}  review "
      puts "\n"
      puts @obj[0].review
    end

end