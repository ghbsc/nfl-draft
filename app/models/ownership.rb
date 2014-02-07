class Ownership < ActiveRecord::Base
  belongs_to :team
  belongs_to :order
  belongs_to :player
  
  def self.draft(round)
    where(round: round)
  end

  def self.latest(num)
    order('drafted_on DESC').limit(num.to_i)
  end
  
 
end
