class Country 
    attr_accessor :confirmed_cases, :overall_deaths, :overall_recovered

    @@all = []
    def initialize( confirmed_cases,  overall_deaths,  overall_recovered )
        @confirmed_cases = confirmed_cases
        @overall_deaths = overall_deaths
        @overall_recovered = overall_recovered
        save
    end

    def save 
        @@all << self
    end
    def self.all 
        @@all
    end

end