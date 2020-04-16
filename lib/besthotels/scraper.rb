class Besthotels::Scraper

   SITE = "https://www.tripadvisor.com/TravelersChoice-Hotels"
   @@doc = Nokogiri::HTML(open(SITE))

    def self.make_hotel
      
      
      hotels= @@doc.css("#WINNERVIEWER div.winnerLayer")
      hash={}
      hash=hotels.map do |i|   
      {
       rank: i.css("div.posn > span").text,
       name: i.css("div.winnerName div.mainName.extra a").text,
       location: i.css("div.winnerName div.smaller a").text,
       url: "https://www.tripadvisor.com"+i.css("div.winnerName div.mainName.extra a").attribute('href').value
       }   
      end

     #aa = doc.css("#WINNERVIEWER div.misc.posRel").css("div").css("ul").css("li")
    # hash1=aa.map  do |i|  {
      # hash[:quotes] <<  i.css("div").text
       # hash.store(:quotes,"#{i.css("div").text}")
    # }
     #end
    Besthotels::Hotels.new_hotel(hash)

    #doc = Nokogiri::HTML(open(SITE))

  end

  def self.add_more_attr
    aa = @@doc.css("#WINNERVIEWER div.misc.posRel").css("div").css("ul").css("li")
    arr=[]
    aa.map  do |i|    
     arr << i.css("div").text.strip  
    end 
    Besthotels::Hotels::all.each_with_index do |i,index|
       i.quotes = arr[index] 
    end   
  end 
  


  def self.get_info_of_each(hotelobj)
      
      doc = Nokogiri::HTML(open(hotelobj.url))
      spec = doc.css("#ABOUT_TAB div.cPQsENeY").text
      cont = doc.css("a > span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI").text
      ameni = doc.css("#BODY_BLOCK_JQUERY_REFLOW div.hotels-hr-about-amenities-Amenity__amenity--3fbBj").text.strip
      hotelobj.specific = spec  
      hotelobj.contact =  cont  
      hotelobj.amenities = ameni  

      aa= doc.css("#component_13 > div > div:nth-child(3) div.social-member-event-MemberEventOnObjectBlock__member_event_block--1Kusx > div > div.social-member-event-MemberEventOnObjectBlock__event_type--3njyv > span")
      aa.each do |i|
        customer = i.css("a").text
        cusobj=Besthotels::Customer.new(customer)
        hotelobj.add_customer(cusobj)
        
       # binding.pry
        
      end
      
      

  end


  #def self.eachwebsite

   #Besthotels::Hotels.all.each do |i|
    #    doc = Nokogiri::HTML(open(i.url))
     #   spec = doc.css("#ABOUT_TAB div.cPQsENeY").text
      #  cont = doc.css("a > span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI").text
       # ameni = doc.css("#BODY_BLOCK_JQUERY_REFLOW div.hotels-hr-about-amenities-Amenity__amenity--3fbBj").text.strip
       # i.specific = spec  
        #i.contact =  cont  
        #i.amenities = ameni  
   #end 
 
  #end


end

