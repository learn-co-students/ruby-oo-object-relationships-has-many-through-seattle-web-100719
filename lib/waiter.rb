class Waiter
    attr_reader :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(customer, self, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        maxTip = 0
        biggestTipper = nil
        
        Meal.all.select do |meal|
            meal.waiter == self
        end.each do |meal|
            if meal.tip > maxTip
                maxTip = meal.tip
                biggestTipper = meal.customer
            end
        end

        biggestTipper
    end

    def self.all
        @@all
    end

end