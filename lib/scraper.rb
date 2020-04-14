require_relative "./concerns/printable"

class Scraper 
    extend Printable::ClassMethods
    URL = "https://www.worldometers.info/coronavirus/country/us/"

    def self.scrape_usa 
        doc = Nokogiri::HTML(open(URL))
        country_table = doc.css(".content-inner .maincounter-number")
        country_confirmed_cases = text_to_integer(country_table[0].text.gsub(/\s+/, ""))
        country_overall_deaths = text_to_integer(country_table[1].text.gsub(/\s+/, ""))
        country_recoveries = text_to_integer(country_table[2].text.gsub(/\s+/, ""))
         Country.new(name: "USA", confirmed_cases: country_confirmed_cases, overall_deaths: country_overall_deaths, recoveries: country_recoveries)
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
end