class Vampire
    attr_reader :name
    attr_reader :pet

    def initialize (name, pet = 'bat')
        @name = name
        @pet = pet
    end

    def thirsty
        @boolean == false ? false : true
    end

    def drink
        @boolean = false
    end
end