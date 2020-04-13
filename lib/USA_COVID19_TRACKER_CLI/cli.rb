class CLI 
    # greets user, scrapes info, runs CLI
    def run
        system("clear")
        greeting
        scrape
        while menu != 'exit'
        end
    end

    # Greets user when runs program
    def greeting 
        puts "Hello! Welcome to State-wide Covid 19 Stats! Here is a list of options you can choose from."
    end

    # Display menu, returns user input
    def menu 
        puts "Please choose an option: "
        list_options
        input = gets.strip.downcase
        getinput = choose_option(input)
        getinput ? input = getinput : input
        return input
    end

    # Prints out menu for user
    def list_options 
        puts <<-DOC.gsub /^\s*/, ''
            1. List all states to get individual statistics
            2. Top ten states with the most confirmed cases
            3. Top ten states with the least confirmed cases 
            4. Top ten States with the most confirmed deaths 
            5. Top Ten States with the least confirmed deaths 
            6. List from most to least confirmed cases by region 
            7. List from most to least confirmed deaths by region
            8. Overall U.S.A Statistics
            9. Enter State Name
               Please enter 'exit' to stop program.
        DOC
    end

    # runs a specific task based on user input
    def choose_option(option)
        result = option
        case option 
        when "1"
            State.print_all
        when "2"
            puts "Top Ten Most Confirmed Cases"
            State.top_ten_confirmed_cases
        when "3"
            puts "Top Ten Least Confirmed Cases"
            State.top_ten_least_confirmed_cases
        when "4"
            puts "Top Ten Most Confirmed Deaths"
            State.top_ten_confirmed_deaths
        when "5"
            puts "Top Ten Least Confirmed Deaths"
            State.top_ten_least_confirmed_deaths
        when "6"
            puts "Most To Least Confirmed Cases By Region"
            State.region_rank_most_to_least_cases
        when "7"
            puts "Most To Least Confirmed Deaths By Region"
            State.region_rank_most_to_least_deaths
        when "8"
            puts "Overall United States Statistics" 
            Country.find_by_name("usa")
        when "9"
            puts "Please enter the state name you like to find"
            input = gets.strip.downcase.to_str
            State.find_by_name(input)
        end
        result
    end

    # Scrapes state info
    def scrape
        Scraper.scrape_usa
        Scraper.scrape_states
    end
end