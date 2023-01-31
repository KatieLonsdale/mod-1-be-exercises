class Hydra
    attr_reader :name, :color
    attr_accessor :opponents, :beheaded_count, :heads

    def initialize(name, color = 'purple')
        @name = name
        @color = color
        @heads = 1
        @opponents = []
        @beheaded_count = 0
        @dead = false
    end

    def appears(opponent)
        @opponents.push(opponent)
        opponent.fight_status = true
        # change method name for better readability challenged?
    end

    def behead
        @heads -= 1
        @heads +=2
        @beheaded_count += 1

        if @beheaded_count >= 7
            @dead = true
        else
        end
    end

    def dead?
        @dead
    end
end

class Warrior
    attr_reader :name, :attack_count
    attr_accessor :fight_status

    def initialize(name)
        @name = name
        @fight_status = false
        @attack_count = 0
    end

    def attack(hydra)
        if @fight_status == true
            @attack_count += 1
                if @attack_count % 3 == 0
                    hydra.behead
                else
                end
        elsif @fight_status == false
            "Show yourself!"
        end
    end

end