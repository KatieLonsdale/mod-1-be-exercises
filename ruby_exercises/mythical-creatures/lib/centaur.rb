class Centaur
    attr_reader :name, :breed, :cranky, :standing, :actions, :health

    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = false
        @standing = true
        @actions = 0
        @laying = false
        @health = 'healthy'
    end

    def shoot
        if @actions < 3 && @laying == false
            @actions += 1 
            "Twang!!!"
        elsif @actions >= 3 || @laying == true
            "NO!"
        end
    end

    def run
        @laying == true ? "NO!" : (@actions += 1; 'Clop clop clop clop!')
        #not good practice
    end

    def cranky?
        @actions >= 3 ? @cranky = true : @cranky = false
        @cranky
    end

    def standing?
        @standing
    end

    def stand_up
        @standing = true
        @laying = false
    end

    def sleep
        if @standing == true
            "NO!"
        elsif @standing == false && actions >= 3
            true
            @actions = 0
        else
            true
        end
    end

    def lay_down
        @standing = false
        @laying = true
    end

    def laying?
        @laying
    end

    def drink
        if @standing == true && @actions > 0
            @actions = 0
        elsif @actions == 0
            @health = 'sick'
        elsif @standing == false
            'Cannot do that now.'
        end
    end
end