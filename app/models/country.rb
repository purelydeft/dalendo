class Country < ApplicationRecord
    
    has_many :projects

  def self.singlenationality(paramsdata)

    $countryname = paramsdata['obj']
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT nationality FROM countries WHERE id='#$countryname'")
    result1 = result.to_a
    return result1[0]['nationality']

  end


end
