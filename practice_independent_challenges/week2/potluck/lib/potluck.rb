class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(category)
    dishes_in_category = @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    menu_by_course = {}
    @dishes.each do |dish|
      course = dish.category.to_s.concat('s').to_sym
      if menu_by_course.has_key?(course)
        menu_by_course[course].push(dish.name)
        menu_by_course[course].sort!
      else
        menu_by_course[course] = []
        menu_by_course[course].push(dish.name)
      end
    end
    menu_by_course
  end

  def ratio(category)
    count_of_category = @dishes.find_all.count do |dish|
      dish.category == category
    end
    (count_of_category.to_f / dishes.count.to_f) * 100
  end

end