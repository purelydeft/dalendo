class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Projecttype < ActiveRecord::Base
    def self.projects
        ['Presale', 'Donations', 'Solidarity', 'Business', 'Equity']
    end
  end
    
#render plain: params.inspect


end
