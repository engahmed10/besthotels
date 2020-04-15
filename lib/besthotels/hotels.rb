
class Besthotels::Hotels
   
    @@all =[]

    attr_accessor :hotel,:rank,:location,:url,:quotes ,:specific,:contact,:amenities 
    def initialize(hotel)
        assignattribute(hotel)
       # self.specific = ""
       # self.contact = ""
       # self.amenities = ""
        @@all << self        
    end

     
    def self.new_hotel(arrhash)
       arrhash.each do |hotel|
          hotel =  new(hotel)
          Besthotels::Scraper.get_info_of_each(hotel)
       end
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


end
