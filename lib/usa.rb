class USA 
    attr_accessor :confirmed_cases, :overall_deaths, :overall_recovered

    def initialize(confirmed_cases: confirmed_cases, overall_deaths: overall_deaths, overall_recovered: overall_recovered )
        @confirmed_cases = confirmed_cases
        @overall_deaths = overall_deaths
        @overall_recovered = overall_recovered
    end

end