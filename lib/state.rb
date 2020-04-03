class State 
    attr_accessor :name, :confirmed_cases, :overall_deaths

    @@all = []
    western_states = ["Arizona", "Colorado", "Idaho", "Montana", "Nevada", "New Mexico", "Utah", "Wyoming", "Alaska", "California", "Hawaii", "Oregon", "Washington"]
    @@southern_states = ["Alabama", "Arkansas", "Delaware", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virgina", "West Virginia"]
    @@eastern_states = ["Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut", "New York", "Pennsylvania", "New Jersey"]
    @@midwest_states = ["Wisconsin", "Michigan", "Illinois", "Indiana", "Ohio", "North Dakota", "South Dakota", "Nebraska", "Kansas", "Minnesota", "Iowa", "Missouri"]
    
    def initialize(name,  confirmed_cases,  overall_deaths )
        @name = name
        @confirmed_cases = confirmed_cases
        @overall_deaths = overall_deaths
        save
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

    def self.rank_most_confirmed_cases_by_region 
        wregion = 0
        sregion = 0
        eregion = 0
        mregion = 0

        @@all.each do |state| 
            if @@western_states.include?(state.name)
                wregion += state.confirmed_cases
            elsif @@southern_states.include?(state.name)
                sregion += state.confirmed_cases
            elsif @@eastern_states.include?(state.name)
                eregion += state.confirmed_cases
            elsif @@midwest_states.include?(state.name)
                mregion += state.confirmed_cases
            end
        end

        us_region = [{"name"=> "wregion", "confirmed_cases"=> wregion}, {"name"=> "sregion", "confirmed_cases" => sregion}, {"name" => "eregion", "confirmed_cases" => eregion},{ "name" => "mregion", "confirmed_cases" => mregion}]
      
        arr = us_region.sort {|a,b| b["confirmed_cases"] <=> a["confirmed_cases"]}
       
        arr.each_with_index do |region,i|
            puts "#{i+1}. #{region["name"]}"
            puts region["confirmed_cases"]
            puts "------------------------"
        end
    end

    def self.rank_most_overall_deaths_by_region 
        wregion = 0
        sregion = 0
        eregion = 0
        mregion = 0

        @@all.each do |state| 
            if @@western_states.include?(state.name)
                wregion += state.overall_deaths
            elsif @@southern_states.include?(state.name)
                sregion += state.overall_deaths
            elsif @@eastern_states.include?(state.name)
                eregion += state.overall_deaths
            elsif @@midwest_states.include?(state.name)
                mregion += state.overall_deaths
            end
        end

        us_region = [{"name"=> "wregion", "overall_deaths"=> wregion}, {"name"=> "sregion", "overall_deaths" => sregion}, {"name" => "eregion", "overall_deaths" => eregion},{ "name" => "mregion", "overall_deaths" => mregion}]
      
        arr = us_region.sort {|a,b| b["overall_deaths"] <=> a["overall_deaths"]}
   
        arr.each_with_index do |region,i|
            puts "#{i+1}. #{region["name"]}"
            puts region["overall_deaths"]
            puts "------------------------"
        end
    end
end