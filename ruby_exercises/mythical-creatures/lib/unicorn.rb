class Unicorn
    attr_reader :name
    attr_reader :color
    def initialize (name, color = 'silver')
        @name = name
        @color = color
    end

    def color
        @color == 'silver' ? 'silver' : @color
    end

    def silver?
        @color == 'silver' ? true : false
    end

    def say (string)
        "**;* #{string} **;*"
    end

end