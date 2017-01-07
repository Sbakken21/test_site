class PagesController < ApplicationController
    def home
    end
    
    def temp
    end
    
    def signup
      @basic_plan = Plan.find(1)
      @pro_plan = Plan.find(2)
    end
end