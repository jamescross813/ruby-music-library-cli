module Concerns::Findable

    def find_by_name(name)
        self.all.detect{|o| o.name == name}
    end

    def create_by_name(name)
        self.new.tap do |o|
            o.name = name
        end
    end

    def find_or_create_by_name(name)
        if self.all.find_by_name(name) 
         self.all.find_by_name(name) 
         else
             self.all.create_by_name(name)
         end
     end

end