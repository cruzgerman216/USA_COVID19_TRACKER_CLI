
class Scraper 
    URL = "https://www.worldometers.info/coronavirus/country/us/"

    def self.scrape_usa 
        doc = Nokogiri::HTML(open(URL))
        usadata = doc.css(".content-inner .maincounter-number")
        obj = {:confirmed_cases => usadata[0].text.gsub(/\s+/, ""), :overall_deaths => usadata[1].text.gsub(/\s+/, ""), :overall_recovered => usadata[2].text.gsub(/\s+/, "")}
        obj
    end

    def self.text_to_integer(text)
        text.gsub(/\s+/, "").tap { |s| s.delete!(',') }.to_i
    end
    
    def self.scrape_states 
        doc = Nokogiri::HTML(open(URL))
        statesarr = doc.css("tbody tr")
        #51 due to 51 data entries that incldue a non-state "District of Columbia"
        states_length = 51
        i = 1
        while i < states_length
            name = statesarr[i].css("td")[0].text.split(" ").join(" ")

            confirmed_cases = text_to_integer(statesarr[i].css("td")[1].text)
            overall_deaths =  text_to_integer(statesarr[i].css("td")[3].text)
           
            if overall_deaths == "" 
                overall_deaths = 0
            end
            
            if name != "District Of Columbia" 
                State.new(name, confirmed_cases, overall_deaths)
            end
            i += 1
        end
    end

end