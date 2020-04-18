class Besthotels::Customer
     
     @@all =[]
     attr_accessor :name , :hotel, :review

     def initialize(name,review)
       @name = name 
       @review = review
       save
     end
    
     def save
       @@all << self
     end

    # def hotel(hotel)
     #   self.hotel = Besthotels::Hotels.find_or_create_by_name(hotel)       
      #  self.hotel.add_customer(self)
    #end

      def self.find_by_name(name) 
        @@all.select do |i|
          i.name == name
        end
      end
 
      def self.all
          @@all
      end

end

