module Grabable
    module InstanceMethods
        def save 
            self.class.all << self
        end

    end

    module ClassMethods

        # Prints all state information
        def print_all
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")} |#{State.add_spaces_back_front("Total Deaths")}"
            puts "-------------------------------------------------------------------"
            self.all.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(add_commas(state.confirmed_cases))}| #{State.add_spaces(add_commas(state.overall_deaths))}"
            end
        end

        # Prints top ten states with the most cases
        def top_ten_confirmed_cases
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")}"
            puts "---------------------------------------------"
            self.all.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(add_commas(state.confirmed_cases))}"
                break unless i != 9
            end
        end

        # Prints top ten states with the least cases
        def top_ten_least_confirmed_cases
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")}"
            puts "---------------------------------------------"
            self.all[40..-1].reverse.each_with_index do |state,i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(add_commas(state.confirmed_cases))}"
             end
        end
        
        # Prints top ten states with the most deaths
        def top_ten_confirmed_deaths
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Deaths")}"
            puts "---------------------------------------------"
            arr =  self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(add_commas(state.overall_deaths))}"
                break unless i != 9
            end
        end

        # Prints top ten states with the least deaths
        def top_ten_least_confirmed_deaths
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Deaths")}"
            puts "---------------------------------------------"
            arr = self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr[40..-1].reverse.each_with_index do |state,i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(add_commas(state.overall_deaths))}"
            end
        end

        # Finds state by name
        def find_by_name(state_name)
            result = self.all.find {|state| state.name.downcase == state_name}
            if result 
                puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")}  |#{State.add_spaces_back_front("Total Deaths")}"
                puts "-------------------------------------------------------------------"
                puts "#{State.add_spaces(result.name)}| #{State.add_spaces(add_commas(result.confirmed_cases))}| #{State.add_spaces(add_commas(result.overall_deaths))}"
            else 
                puts "#{state_name} does not exist."
                puts "Please enter a valid state name."
                input = gets.strip.downcase.to_str
                find_by_name(input)
            end
        end
    end

end