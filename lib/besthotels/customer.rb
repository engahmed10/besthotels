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

    def self.find_by_name(name) 
       @@all.select { |i| i.name == name }
    end
 
    def self.all
       @@all
    end

end

