
class Scraper 
    URL = "https://www.worldometers.info/coronavirus/country/us/"

    def self.scrape_usa 
        doc = Nokogiri::HTML(open(URL))
        usadata = doc.css(".content-inner .maincounter-number")
        obj = {:confirmed_cases => usadata[0].text.gsub(/\s+/, ""), :overall_deaths => usadata[1].text.gsub(/\s+/, ""), :overall_recovered => usadata[2].text.gsub(/\s+/, "")}
        obj
    end

    #scraping data of state information
    def self.scrape_states 
        covid_doc = Nokogiri::HTML(open(URL))
        states_array_table = covid_doc.css("tbody tr")
        states_array_table[1..51].each do |state_row_data|
            state_name = state_row_data.css("td")[0].text.split(" ").join(" ")
            overall_deaths = text_to_integer(state_row_data.css("td")[3].text)
            confirmed_cases = text_to_integer(state_row_data.css("td")[1].text)
            if state_name != "District Of Columbia" 
                State.new(name: state_name, confirmed_cases: confirmed_cases, overall_deaths: overall_deaths)
            end
        end
    end

    # removing commas, empty spaces, turn string into integer
    def self.text_to_integer(text)
        text == "" ? output = 0 : output = text.gsub(/\s+/, "").tap { |s| s.delete!(',') }.to_i
        output
    end
    
end