require 'patron'

RSpec.describe Patron do
  let(:patron_1) {Patron.new("Bob", 20)}
  it 'Exists and has instance variables' do
    expect(patron_1).to be_an_instance_of(Patron)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
  end

  it 'has interests and can add more' do
    expect(patron_1.interests).to eq([])
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end
