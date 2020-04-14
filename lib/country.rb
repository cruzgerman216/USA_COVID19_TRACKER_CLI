require_relative "./concerns/grabable"
require_relative "./concerns/printable"

class Country 
    include Grabable::InstanceMethods
    extend Grabable::Statistics
    attr_accessor :name, :confirmed_cases, :overall_deaths, :recoveries

    
    @@countries = []

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
        save
    end

    def self.all 
        @@countries
    end

end