
class Besthotels::HOTELS
   
    @@all =[]

    attr_accessor :hotel,:rank,:location,:url
    def initialize(hotel)
        assignattribute(hotel)
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

    def self.all
        @@all
    end


end
