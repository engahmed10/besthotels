class Besthotels::Customer
     
    @@all =[]
    attr_accessor :name , :hotel

     def initialize(name)
       @name = name 
       save
    end
    
    def save
       @@all << self
    end

    # def hotel(hotel)
     #   self.hotel = Besthotels::Hotels.find_or_create_by_name(hotel)       
      #  self.h                           otel.add_customer(self)
    #end

 
    def self.all
        @@all
    end

end

