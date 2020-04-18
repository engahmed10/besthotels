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

       Besthotels::Hotels.new_hotel(hotel_hashes)

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
      #assign scriped data (attributes) to passed object 
      hotelobj.specific = spec  
      hotelobj.contact =  cont  
      hotelobj.amenities = ameni  
      #getting customer and review ,then make new instance
      aa=doc.css("#component_13 > div > div:nth-child(3)  div.hotels-community-tab-common-Card__card--ihfZB.hotels-community-tab-common-Card__section--4r93H")
      aa.each do |i|
           customer_n= i.css("div.social-member-event-MemberEventOnObjectBlock__member_event_block--1Kusx > div > div.social-member-event-MemberEventOnObjectBlock__event_type--3njyv > span > a").text
           review= i.css("div.cPQsENeY > q").text
           cusobj=Besthotels::Customer.new(customer_n,review)
           hotelobj.add_customer(cusobj)
      end
  end



end

