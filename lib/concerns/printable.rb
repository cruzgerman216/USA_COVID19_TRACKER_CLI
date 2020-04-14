module Printable
    module Styles
        # Adds Spaces to headers in style print
        def add_spaces(str)
            str = str.to_s
            get_space = 20 - str.length
            spaces = "" 
            (1..get_space).each{|i| spaces += " "}
            getstr = str + spaces
            getstr
        end

        # Adds Spaces to data entries in style print 
        def add_spaces_back_front(str)
            str = str.to_s
            get_space = 20 - str.length
            spaces = "" 
            (1..get_space/2).each{|i| spaces += " "}
            getstr = spaces + str + spaces
            getstr
        end

        # Adds commas in string
        def add_commas(int)
            str = int.to_s
            str.reverse.scan(/\d{3}|.+/).join(",").reverse
        end

        # removing commas, empty spaces, turn string into integer
        def text_to_integer(text)
            text == "" ? output = 0 : output = text.gsub(/\s+/, "").tap { |s| s.delete!(',') }.to_i
            output
        end
    end
end