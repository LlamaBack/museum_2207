require 'exhibit'
require 'patron'

class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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
end
