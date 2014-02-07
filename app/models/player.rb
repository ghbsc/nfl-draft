class Player < ActiveRecord::Base
  belongs_to :team
  has_one :ownership

  scope :draftable, -> { where('team_id is null') }

  def self.select(selected_player_ids)
    selected_player_ids_str = selected_player_ids.join(", ")
               
    where("id NOT IN (#{selected_player_ids_str})").order("RANDOM()").first
  end

  def self.search(position)
    if position == ''
      where('team_id is null', position).order(:name)
    else
      where('team_id is null and position = ?', position).order(:name)
    end
  end

end
