class Customer
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(self, waiter, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters
        Meal.all.select do |meal|
            meal.customer == self
        end.map do |meal|
            meal.waiter
        end
    end

    def self.all
        @@all
    end

end