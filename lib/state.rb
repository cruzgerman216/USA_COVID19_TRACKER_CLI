require_relative "./concerns/grabable"

class State 
    include Grabable::InstanceMethods
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

    def self.add_spaces(str)
        str = str.to_s
        get_space = 20 - str.length
        spaces = "" 
        (1..get_space).each{|i| spaces += " "}
        getstr = str + spaces
        getstr
    end
    def self.add_spaces_back_front(str)
        str = str.to_s
        get_space = 20 - str.length
        spaces = "" 
        (1..get_space/2).each{|i| spaces += " "}
        getstr = spaces + str + spaces
        getstr
    end

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

    def self.rank_most_to_least_region(get_key)
        puts "#{State.add_spaces_back_front("Region")}|#{State.add_spaces_back_front("Total Cases")}"
        key = get_key.to_sym
        us_region = [@@wregion, @@sregion, @@mregion, @@eregion]
        arr = us_region.sort {|a,b| b[key] <=> a[key]}
        arr.each_with_index do |region,i|
            puts "#{State.add_spaces((i+1).to_s + ". " + region[:name])}| #{State.add_spaces(region[key])}"
        end
    end

end