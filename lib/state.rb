class State 
    attr_accessor :name, :confirmed_cases, :overall_deaths, :overall_recovered

    @@all = []

    def initialize(name: name, confirmed_cases: confirmed_cases, overall_deaths: overall_deaths, overall_recovered: overall_recovered )
        @name = name
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

    def rank_in_deaths

    end

    def rank_in_confirmed_cases

    end

    def rank_in_recoveries 


    end
end