require_relative "./printable"

module Grabable
    module InstanceMethods
        def save 
            self.class.all << self
            all = self.class.all.sort {|a,b| a.name <=> b.name}
        end

    end

    module ClassMethods
        # Prints all state information
    include Printable::ClassMethods

        def print_all
            puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Cases")} |#{self.add_spaces_back_front("Total Deaths")}"
            puts "-------------------------------------------------------------------"
            self.all.each_with_index do |state, i|
                puts "#{self.add_spaces((i+1).to_s + ". " + state.name)}| #{self.add_spaces(add_commas(state.confirmed_cases))}| #{self.add_spaces(add_commas(state.overall_deaths))}"
            end
        end

        # Prints top ten states with the most cases
        def top_ten_confirmed_cases
            puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Cases")}"
            puts "---------------------------------------------"
            arr =  self.all.sort {|a,b| b.confirmed_cases <=> a.confirmed_cases}
            arr.each_with_index do |state, i|
                puts "#{self.add_spaces((i+1).to_s + ". " + state.name)}| #{self.add_spaces(add_commas(state.confirmed_cases))}"
                break unless i != 9
            end
        end

        # Prints top ten states with the least cases
        def top_ten_least_confirmed_cases
            puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Cases")}"
            puts "---------------------------------------------"
            arr =  self.all.sort {|a,b| b.confirmed_cases <=> a.confirmed_cases}
            arr[40..-1].reverse.each_with_index do |state,i|
                puts "#{self.add_spaces((i+1).to_s + ". " + state.name)}| #{self.add_spaces(add_commas(state.confirmed_cases))}"
             end
        end
        
        # Prints top ten states with the most deaths
        def top_ten_confirmed_deaths
            puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Deaths")}"
            puts "---------------------------------------------"
            arr =  self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr.each_with_index do |state, i|
                puts "#{self.add_spaces((i+1).to_s + ". " + state.name)}| #{self.add_spaces(add_commas(state.overall_deaths))}"
                break unless i != 9
            end
        end

        # Prints top ten states with the least deaths
        def top_ten_least_confirmed_deaths
            puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Deaths")}"
            puts "---------------------------------------------"
            arr = self.all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
            arr[40..-1].reverse.each_with_index do |state,i|
                puts "#{self.add_spaces((i+1).to_s + ". " + state.name)}| #{self.add_spaces(add_commas(state.overall_deaths))}"
            end
        end

        # Finds state by name
        def find_by_name(state_name)
            result = all.find {|state| state.name.downcase == state_name}
            if result 
                puts "#{self.add_spaces_back_front("USA State")} |#{self.add_spaces_back_front("Total Cases")}  |#{self.add_spaces_back_front("Total Deaths")}"
                puts "-------------------------------------------------------------------"
                puts "#{self.add_spaces(result.name)}| #{self.add_spaces(add_commas(result.confirmed_cases))}| #{self.add_spaces(add_commas(result.overall_deaths))}"
            else 
                puts "#{state_name} does not exist."
                puts "Please enter a valid state name."
                input = gets.strip.downcase.to_str
                input != 'exit' ? find_by_name(input) : nil
            end
        end
    end
    
end