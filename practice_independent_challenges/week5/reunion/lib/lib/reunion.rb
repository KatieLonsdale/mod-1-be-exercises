class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost_of_reunion
    @activities.map {|activity| activity.total_cost}.sum
  end

  def each_participant_owes
    owed_by_activity = @activities.map do |activity|
      activity.owed
    end

    h1 = nil
    owed_by_activity.each_with_index do |hash, idx|
      if idx == 0
        h1 = hash
      else
        hash.merge!(h1){|h,v1,v2| v1 + v2}
        h1 = hash
      end
    end
    h1
  end

  def print_receipt
    hash = each_participant_owes
    hash.each do |k,v|
      puts "#{k} owes #{v}"
    end
  end
end