class Wizard
    attr_reader :name, :bearded, :tiredness

    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @tiredness = 0
    end

    def bearded?
        @bearded
    end

    def incantation(phrase)
        "sudo #{phrase}"
    end

    def rested?
        @tiredness >= 3 ? false : true
    end

    def cast
        @tiredness += 1
        "MAGIC MISSILE!"
    end
end