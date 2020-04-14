
class Besthotels::Hotels
   
    @@all =[]

    attr_accessor :hotel,:rank,:location,:url ,:specific,:contact,:amenities
    def initialize(hotel)
        assignattribute(hotel)
       # self.specific = ""
       # self.contact = ""
       # self.amenities = ""
        @@all << self        
    end

     
    def self.newhotel(hash)
       hash.each do |hotel|
        new(hotel)
       end
    end

    def assignattribute(attr)
     attr.each do |key,value|
        self.send(("#{key}="),value)
     end
    end

    def self.find_by_rank(rank)
        @@all.select { |i| 

               if  i.rank == rank  
                  puts i.specific
               end
            }
       
    end

    def self.all
        @@all
    end


end
