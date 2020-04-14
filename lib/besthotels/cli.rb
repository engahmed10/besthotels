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
         
         #binding.pry
         
         puts "There is a list "
         puts "for more detalis about each hotel ,choose the number from 1 to 25"
         
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
        aa.each_with_index do |value,i|
          puts "#{i+1}. #{value.hotel}.      #{value.location} "
        end
    end
    
  
  
  end