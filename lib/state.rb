require_relative "./concerns/grabable"
require_relative "./concerns/printable"

class State 
    include Grabable::InstanceMethods
    extend Printable::ClassMethods
    extend Grabable::ClassMethods
    attr_accessor :name, :confirmed_cases, :overall_deaths

    @@all = []
    @@wregion = {name: "West Region", confirmed_cases: 0, overall_deaths: 0}
    @@sregion = {name: "South Region", confirmed_cases: 0, overall_deaths: 0}
    @@mregion = {name: "Midwest Region", confirmed_cases: 0, overall_deaths: 0}
    @@eregion = {name: "East Region", confirmed_cases: 0, overall_deaths: 0}

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
        save
        add_to_region
    end
    def self.all 
        @@all
    end

    # instance will add to region class variable confirmed cases and overall deaths based on region
    def add_to_region
        western_states = ["Arizona", "Colorado", "Idaho", "Montana", "Nevada", "New Mexico", "Utah", "Wyoming", "Alaska", "California", "Hawaii", "Oregon", "Washington"]
        southern_states = ["Alabama", "Arkansas", "Delaware", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virgina", "West Virginia"]
        eastern_states = ["Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut", "New York", "Pennsylvania", "New Jersey"]
        midwest_states = ["Wisconsin", "Michigan", "Illinois", "Indiana", "Ohio", "North Dakota", "South Dakota", "Nebraska", "Kansas", "Minnesota", "Iowa", "Missouri"]

        if western_states.include?(name)
            @@wregion[:confirmed_cases] += self.confirmed_cases
            @@wregion[:overall_deaths] += self.overall_deaths
        elsif southern_states.include?(name)
            @@sregion[:confirmed_cases] += self.confirmed_cases
            @@sregion[:overall_deaths] += self.overall_deaths
        elsif eastern_states.include?(name)
            @@eregion[:confirmed_cases] += self.confirmed_cases
            @@eregion[:overall_deaths] += self.overall_deaths
        elsif midwest_states.include?(name)
            @@mregion[:confirmed_cases] += self.confirmed_cases
            @@mregion[:overall_deaths] += self.overall_deaths
        end

    end

    def self.region_rank_most_to_least_cases
        puts "#{State.add_spaces_back_front("Region")}|#{State.add_spaces_back_front("Total Cases")}"
        puts "---------------------------------------------"
        us_region = [@@wregion, @@sregion, @@mregion, @@eregion]
        arr = us_region.sort {|a,b| b[:confirmed_cases] <=> a[:confirmed_cases]}
        arr.each_with_index do |region,i|
            puts "#{State.add_spaces((i+1).to_s + ". " + region[:name])}| #{State.add_spaces(add_commas(region[:confirmed_cases]))}"
        end
    end

    def self.region_rank_most_to_least_deaths
        puts "#{State.add_spaces_back_front("Region")}|#{State.add_spaces_back_front("Total Cases")}"
        puts "---------------------------------------------"
        us_region = [@@wregion, @@sregion, @@mregion, @@eregion]
        arr = us_region.sort {|a,b| b[:overall_deaths] <=> a[:overall_deaths]}
        arr.each_with_index do |region,i|
            puts "#{State.add_spaces((i+1).to_s + ". " + region[:name])}| #{State.add_spaces(add_commas(region[:overall_deaths]))}"
        end
    end
end