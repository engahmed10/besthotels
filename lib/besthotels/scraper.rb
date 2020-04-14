class Besthotels::Scraper


    def self.makehotel

       site = "https://www.tripadvisor.com/TravelersChoice-Hotels"
          doc = Nokogiri::HTML(open(site))
          beaches= doc.css("#WINNERVIEWER div.winnerLayer")
          hash=beaches.map do |i|
    
      {
       rank: i.css("div.posn > span").text,
       hotel: i.css("div.winnerName div.mainName.extra a").text,
       location: i.css("div.winnerName div.smaller a").text,
       url: "https://www.tripadvisor.com"+i.css("div.winnerName div.mainName.extra a").attribute('href').value
       }
    
    end
    hash

    Besthotels::Hotels.newhotel(hash)

  end

  def self.eachwebsite

   Besthotels::Hotels.all.each do |i|
        doc = Nokogiri::HTML(open(i.url))
        spec = doc.css("#ABOUT_TAB div.cPQsENeY").text
        cont = doc.css("a > span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI").text
        ameni = doc.css("#BODY_BLOCK_JQUERY_REFLOW div.hotels-hr-about-amenities-Amenity__amenity--3fbBj").text.strip
        i.specific = spec  
        i.contact =  cont  
        i.amenities = ameni  
   end 
 
  end


end


