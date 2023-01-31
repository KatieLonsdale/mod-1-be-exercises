class Pirate
    attr_reader :name, :job, :crimes, :booty

    def initialize(name, job = 'Scallywag')
        @name = name
        @job = job
        @crimes = 0
        @booty = 0
    end

    def cursed?
        @crimes >= 3 ? true : false
    end

    def commit_heinous_act
        @crimes += 1
    end

    def rob_ship
        @booty += 100
    end
end