
class Besthotels::Hotels
   
    @@all =[]

    attr_accessor :hotel,:rank,:location,:url ,:specific
    def initialize(hotel)
        assignattribute(hotel)
        self.specific = ""
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
