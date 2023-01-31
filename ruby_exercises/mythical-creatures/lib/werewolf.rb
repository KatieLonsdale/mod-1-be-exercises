class Werewolf
    attr_reader :name, :location, :human

    def initialize(name, location = 'London')
        @name = name
        @location = location
        @human = true
        @wolf = false
        @hungry = false
    end

    def human?
        @human
    end

    def wolf?
        @wolf
    end

    def change!
        if @human == true
            @wolf = true
            @human = false
            @hungry = true
        else
            @wolf = false
            @human = true
        end
    end

    def hungry?
        @hungry
    end

    def consume(victim)
        @human ? nil : victim.status = :dead
        @human ? nil : @hungry = false
    end
end