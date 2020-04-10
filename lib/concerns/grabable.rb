module Grabable
    module InstanceMethods
        def save 
            self.class.all << self
        end
        
    end

    module ClassMethods
        def print_all
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")} |#{State.add_spaces_back_front("Total Deaths")}"
            puts "-------------------------------------------------------------------"
            self.all.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(state.confirmed_cases)}| #{State.add_spaces(state.overall_deaths)}"
            end
        end

        def top_ten_confirmed_cases
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")}"
            self.all.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(state.confirmed_cases)}"
                break unless i != 9
            end
        end

        def top_ten_least_confirmed_cases
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Cases")}"
             self.all[40..-1].reverse.each_with_index do |state,i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(state.confirmed_cases)}"
             end
        end

        
        def top_ten_confirmed_deaths
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Deaths")}"
            arr =  self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr.each_with_index do |state, i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(state.overall_deaths)}"
                break unless i != 9
            end
        end

        def top_ten_least_confirmed_deaths
            puts "#{State.add_spaces_back_front("USA State")} |#{State.add_spaces_back_front("Total Deaths")}"
            arr = self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr[40..-1].reverse.each_with_index do |state,i|
                puts "#{State.add_spaces((i+1).to_s + ". " + state.name)}| #{State.add_spaces(state.overall_deaths)}"
            end
        end
        def find_by_name(state_name)
            result = self.all.find {|state| state.name.downcase == state_name}
            if result 
                puts "Here is info on #{result.name}"
                puts "Confirmed Cases: #{result.confirmed_cases}"
                puts "Overall Deaths: #{result.overall_deaths}"
            else 
                puts "#{state_name} does not exist."
            end
        end

    end
end