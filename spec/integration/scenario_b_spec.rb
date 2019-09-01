RSpec.describe '5x5 plateau, two rovers and an invalid movement' do
  let!(:file_path) { 'spec/fixtures/scenario_b.txt' }
  let!(:loader) { FileLoader.new(file_path) }

  before(:each) do
    loader.load!
  end

  context 'first rover' do
    let!(:rover) { loader.rovers[0] }

    before(:each) do
      rover.start!
    end

    it 'finishes at position 1 3' do
      expect(rover.coordinates).to eq([1, 3])
    end

    it 'faces South' do
      expect(rover.direction.facing).to eq('S')
    end
  end

  context 'second rover' do
    let!(:rover) { loader.rovers[1] }

    it 'raises InvalidMovementError' do
      expect do
        rover.start!
      end.to raise_error(InvalidMovementError)
    end
  end
end
