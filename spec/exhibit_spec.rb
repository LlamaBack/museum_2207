require './lib/exhibit'

RSpec.describe Exhibit do

  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  it 'Exists and has instance variables' do
    expect(exhibit).to be_an_instance_of(Exhibit)
    expect(exhibit.name).to eq("Gems and Minerals")
    expect(exhibit.cost).to eq(0)
  end
end
