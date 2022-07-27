require 'patron'

RSpec.describe Patron do
  let(:patrion_1) {Patron.new("Bob", 20)}
  it 'Exists' do
    expect(patron_1).to be_an_instance_of(Patron)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
  end
  
end
