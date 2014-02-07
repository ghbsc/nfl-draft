class Order < ActiveRecord::Base
  has_one :ownership
  belongs_to :team
  
  def self.next
    includes(:ownership)
    .where('ownerships.drafted_on is null')
    .references(:ownership) 
    .order('order_id').limit(1)
    .first
  end

  def self.search(round, team_id)
    if round == ''
      joins(:ownership)
      .where(team_id: team_id)
      .order(:round)
    else
      joins(:ownership)
      .where(round: round, team_id: team_id)
      .order(:round)
    end
  end

end
