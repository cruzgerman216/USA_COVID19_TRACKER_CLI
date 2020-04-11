module Printable
    module ClassMethods
        def add_spaces(str)
            str = str.to_s
            get_space = 20 - str.length
            spaces = "" 
            (1..get_space).each{|i| spaces += " "}
            getstr = str + spaces
            getstr
        end
        def add_spaces_back_front(str)
            str = str.to_s
            get_space = 20 - str.length
            spaces = "" 
            (1..get_space/2).each{|i| spaces += " "}
            getstr = spaces + str + spaces
            getstr
        end

        def add_commas(int)
            str = int.to_s
            str.reverse.scan(/\d{3}|.+/).join(",").reverse
        end
    end
end