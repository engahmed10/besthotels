class Besthotels::SCRAPER

    SITE = "https://www.tripadvisor.com/TravelersChoice-Hotels"
    


    def scraper_website 
         doc = Nokogiri::HTML(open(SITE))
    end


    def self.makehotel


          doc = Nokogiri::HTML(open(SITE))
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

end