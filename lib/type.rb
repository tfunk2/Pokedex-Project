class Type < ActiveRecord::Base
    has_many :pokemon

    def self.list_of_types
        all.map do |type|
            type.name.capitalize
        end
    end
end