class Besthotels::Scraper

   SITE = "https://www.tripadvisor.com/TravelersChoice-Hotels"
   

    def self.make_hotel
      
      doc = Nokogiri::HTML(open(SITE))
      hotels= doc.css("#WINNERVIEWER div.winnerLayer")
     
      hotel_hashes=hotels.map do |i|   
      {
       rank: i.css("div.posn > span").text,
       name: i.css("div.winnerName div.mainName.extra a").text,
       location: i.css("div.winnerName div.smaller a").text,
       url: "https://www.tripadvisor.com"+i.css("div.winnerName div.mainName.extra a").attribute('href').value
       }   
      end

      # aa = doc.css("#WINNERVIEWER div.misc.posRel").css("div").css("ul").css("li")
       # hash1=aa.map  do |i|  {
       #   hash[:quotes] <<  i.css("div").text
        #  hash.store(:quotes,"#{i.css("div").text}")
       #}
        #end

       Besthotels::Hotels.new_hotel(hotel_hashes)

       #doc = Nokogiri::HTML(open(SITE))

    end

  def self.add_more_attr
    doc = Nokogiri::HTML(open(SITE))
    aa = doc.css("#WINNERVIEWER div.misc.posRel").css("div").css("ul").css("li")
    arr=[]
    aa.map do |i|    
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

      #aa = doc.css("div:nth-child(3) div.social-member-event-MemberEventOnObjectBlock__member_event_block--1Kusx > div > div.social-member-event-MemberEventOnObjectBlock__event_type--3njyv > span")
     # aa.each do |i|
      #  customer = i.css("a").text
       # cusobj=Besthotels::Customer.new(customer)
       # hotelobj.add_customer(cusobj)
     # end

     # bb=doc.css("#component_13 > div > div:nth-child(3)")
     # bb.each do |i|
      #  rev = i.css("div.cPQsENeY > q").text
       # cusobj.review = rev
      #end

      aa=doc.css("#component_13 > div > div:nth-child(3)  div.hotels-community-tab-common-Card__card--ihfZB.hotels-community-tab-common-Card__section--4r93H")
      aa.each do |i|
         customer_n= i.css("div.social-member-event-MemberEventOnObjectBlock__member_event_block--1Kusx > div > div.social-member-event-MemberEventOnObjectBlock__event_type--3njyv > span > a").text
         review= i.css("div.cPQsENeY > q").text
         cusobj=Besthotels::Customer.new(customer_n,review)
         hotelobj.add_customer(cusobj)
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

