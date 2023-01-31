class Medusa
    attr_reader :name, :statues

    def initialize(name)
        @name = name
        @statues = []
    end

    def stare(victim)
        if @statues.length < 3
            @statues.unshift(victim)
            victim.petrify
        else
            @statues.shift.freed
            @statues.unshift(victim)
            victim.petrify
        end
    end
end

class Person
    attr_reader :name
    attr_accessor :stoned

    def initialize(name, stoned = false)
        @name = name
        @stoned = stoned
    end

    def stoned?
        @stoned
    end

    def petrify
        @stoned = true
    end

    def freed
        @stoned = false
    end

end