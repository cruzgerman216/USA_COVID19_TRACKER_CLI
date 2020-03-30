class CLI 
    def run
        greeting
        input = ""
        while input != 'exit'
            input = menu 
            choose_option(input)
        end
    end

    def greeting 
        puts "Hello! Welcome to State-wide Covid 19 Stats! Here is a list of options you can choose from."
    end

    def menu 
        puts "Please choose an option: "
        list_options
        input = gets.strip.downcase
        return input
    end

    def list_options 
        puts <<-DOC.gsub /^\s*/, ''
            1. List all states to get individual statistics
            2. Top ten states with the most confirmed cases
            3. Top ten states with the least confirmed cases 
            4. Top ten States with the most confirmed deaths 
            5. Top Ten States with the least confirmed deaths 
            6. List from most to most confirmed cases by region 
            7. List from most to least confirmed deaths by region
            8. Overall U.S.A Statistics
        DOC
    end

    def choose_option(option)
        if option != "exit"
            getinput = option.to_i
        end
        case getinput 
        when 1
            puts "one"
        when 2
            puts "two"
        when 3
            puts "three"
        when 4
            puts "four"
        when 5
            puts "five"
        when 6
            puts "six"
        when 7
            puts "seven"
        when 8
            puts "eight"
        end
    end
end