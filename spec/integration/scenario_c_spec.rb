RSpec.describe '6x2 plateau and three rovers' do
  let!(:file_path) { 'spec/fixtures/scenario_c.txt' }
  let!(:loader) { FileLoader.new(file_path) }

  before(:each) do
    loader.load!
  end

  context 'first rover' do
    let!(:rover) { loader.rovers[0] }

    before(:each) do
      rover.start!
    end

    it 'finishes at position 3 0' do
      expect(rover.coordinates).to eq([3, 0])
    end

    it 'faces South' do
      expect(rover.direction.facing).to eq('S')
    end
  end

  context 'second rover' do
    let!(:rover) { loader.rovers[1] }

    before(:each) do
      rover.start!
    end

    it 'finishes at position 2 1' do
      expect(rover.coordinates).to eq([2, 1])
    end

    it 'faces North' do
      expect(rover.direction.facing).to eq('N')
    end
  end

  context 'second rover' do
    let!(:rover) { loader.rovers[2] }

    before(:each) do
      rover.start!
    end

    it 'finishes at position 0 1' do
      expect(rover.coordinates).to eq([0, 1])
    end

    it 'faces West' do
      expect(rover.direction.facing).to eq('W')
    end
  end
end
