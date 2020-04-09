class State 
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

    def save 
        @@all << self
    end

    def self.print_all
        State.all.each_with_index do |state, i|
            puts "#{i+1}. #{state.name}"
            puts "Confirmed Cases: #{state.confirmed_cases}"
            puts "Deaths: #{state.overall_deaths}"
        end
    end

    def self.top_ten_confirmed_cases
        State.all.each_with_index do |state, i|
            puts "#{i+1}. #{state.name}"
            puts "Confirmed Cases: #{state.confirmed_cases}"
            break unless i != 9
        end
    end

    def self.top_ten_least_confirmed_cases
         State.all[40..-1].reverse.each_with_index do |state,i|
            puts "#{i+1}. #{state.name}"
            puts "Confirmed Cases: #{state.confirmed_cases}"
         end
    end


    def self.top_ten_confirmed_deaths
        arr =  @@all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
        arr.each_with_index do |state, i|
            puts "#{i+1}. #{state.name}"
            puts "Confirmed Deaths: #{state.overall_deaths}"
            break unless i != 9
        end
    end

    def self.top_ten_least_confirmed_deaths
        arr = @@all.sort {|a,b| b.overall_deaths <=> a.overall_deaths}
        arr[40..-1].reverse.each_with_index do |state,i|
            puts "#{i+1}. #{state.name}"
            puts "Confirmed Deaths: #{state.overall_deaths}"
        end
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
        key = get_key.to_sym
        us_region = [@@wregion, @@sregion, @@mregion, @@eregion]
        arr = us_region.sort {|a,b| b[key] <=> a[key]}
        arr.each_with_index do |region,i|
            puts "#{i+1}. #{region[:name]}"
            puts region[key]
            puts "------------------------"
        end
    end

    def self.find_by_name(state_name)
        result = State.all.find {|state| state.name.downcase == state_name}
        if result 
            puts "Here is info on #{result.name}"
            puts "Confirmed Cases: #{result.confirmed_cases}"
            puts "Overall Deaths: #{result.overall_deaths}"
        else 
            puts "#{state_name} does not exist."
        end
    end

end