class Show < ActiveRecord::Base

    def self.highest_rating
        self.all.maximum(:rating) # call maximum on the whole collection of instances 
    end
    
    def self.most_popular_show
        # self.where("rating = ?", 10).map {|s| s.name} returns array for rick and morty
        highest_rating = self.highest_rating
        self.find_by(rating: highest_rating) #returns instance of rick and morty 
    end

    def self.lowest_rating #if its a column or table query, affects all instances, class method/ .self
        self.minimum(:rating)
    end

    def self.least_popular_show
        lowest_rating = self.lowest_rating
        self.find_by(rating: lowest_rating)
    end

    def self.ratings_sum
        self.all.sum(:rating)
    end

    def self.popular_shows
        self.all.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order #returns an array 
        self.all.order(:name)
    end

end
