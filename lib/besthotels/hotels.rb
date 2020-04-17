
class Besthotels::Hotels
   
    @@all =[]

    attr_accessor :name,:rank,:location,:url,:quotes ,:specific,:contact,:amenities,:customers 
    def initialize(name,specific=nil,contact =nil,amenities=nil,quotes=nil)
        assignattribute(name)   
        @customers=[]  
        save  
                
    end

          
    def self.new_hotel(arrhash)
       arrhash.each do |name|
           new(name)
       end
    end
     

    def save 
      @@all << self 
    end

    def assignattribute(attr)
       attr.each do |key,value|
          self.send(("#{key}="),value)
       end
    end

    def self.find_by_rank(rank)

       @@all.select { |i| 
                 i.rank == rank  
            }    
    end

    def self.all
        @@all                       
    end

    def add_customer(cusobj) 
        cusobj.hotel = self if cusobj.hotel == nil                
        @customers << cusobj   unless customers.include?cusobj
        #cusobj.hotel = self if cusobj.hotel == nil        
    end

   def self.find_or_create_by_name(hotel)
      if self.find_hotel(hotel)
         self.find_hotel(hotel)
      else
         Besthotels::Hotels.new(hotel)
      end
   end

   def self.find_hotel(hotel)
     @@all.detect do |i|
          i.hotel == hotel
     end
   end


end

