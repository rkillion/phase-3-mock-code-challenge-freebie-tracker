class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def self.showme(name)
        self.find_by(name: name)
    end

    def received_one?(item_name)
        self.freebies.include?(Freebie.find_by(item_name: item_name))
    end

    def give_away(dev,freebie)
        if freebie.dev.id == self.id
            freebie.update(dev_id: dev.id)
        else 
            print "#{self.name} does not have #{freebie.item_name}!"
        end
    end
end
