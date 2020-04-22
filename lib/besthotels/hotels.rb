
class Besthotels::Hotels
   
    @@all =[]
    attr_accessor :name,:rank,:location,:url,:specific,:contact,:amenities,:customers 
    def initialize(hotel,specific=nil,contact =nil,amenities=nil,quotes=nil)
      assignattribute(hotel)   
      @customers=[]  
      save                 
    end

    def self.new_hotel(arrhash)
      arrhash.each { |hotel| new(hotel) }
    end
   
    def save 
       @@all << self 
    end

    def assignattribute(hotel)
       hotel.each { |key,value| self.send(("#{key}="),value) }
    end

    def self.find_by_rank(rank)     
      @@all.select { |i|  i.rank == rank  }    
    end

    def self.all
      @@all                       
    end

    def add_customer(cusobj) 
        cusobj.hotel = self if cusobj.hotel == nil                
        @customers << cusobj  unless customers.include?cusobj      
    end
     
    def self.prepare_to_list
      Besthotels::Scraper.script_all_hotels
    end

   # def self.find_or_create_by_name(hotel)
    #  if self.find_hotel(hotel)
     #    self.find_hotel(hotel)
     # else
      #   Besthotels::Hotels.new(hotel)
     # end
   # end

    #def self.find_hotel(hotel)
     #  @@all.detect do |i|
      #   i.name == hotel
      # end
   # end


end

