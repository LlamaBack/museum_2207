require 'exhibit'
require 'patron'

class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @lottery_winners = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interests = {}
    @exhibits.each do |exhibit|
      exhibit_interests[exhibit] = @patrons.find_all do |patron|
        patron.interests.include?(exhibit.name)
      end
    end
    exhibit_interests
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) == []
      return nil
    end

    winner = ticket_lottery_contestants(exhibit).sample
    @lottery_winners[exhibit] = winner
    winner.name
  end

  def announce_lottery_winner(exhibit)
    if !@lottery_winners.key?(exhibit)
      return "No winners for this lottery"
    end

    return "#{@lottery_winners[exhibit].name} has won the #{exhibit.name} exhibit lottery"
  end

end
