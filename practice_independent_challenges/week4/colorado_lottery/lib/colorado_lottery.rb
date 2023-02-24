class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = Hash.new{|hash, game| hash[game] = []}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    (contestant.age >= 18) && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    eligible = false
    unless !interested_and_18?(contestant, game)
      if game.national_drawing? || !contestant.out_of_state?
        eligible = true 
      end
    end
    eligible
  end

  def register_contestant(contestant, game)
    unless !can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    @registered_contestants.dig(game.name).map do |contestant| 
      contestant if contestant.spending_money >= game.cost
    end
  end
end