class User < ActiveRecord::Base
    validates_presence_of :password
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.happiness && self.nausea
       mood = self.happiness - self.nausea
            if mood < 0
                "sad"
            else
                "happy"
            end
        end
    end
end
