RSpec.describe FileLoader do
  describe 'initialization' do
    let!(:file_path) { 'spec/fixtures/scenario_a.txt' }

    it 'fills lines array' do
      loader = FileLoader.new(file_path)

      expect(loader.lines.size).to eq(5)
    end

    it 'sets an empty array to @rovers' do
      loader = FileLoader.new(file_path)

      expect(loader.rovers).to eq([])
    end
  end

  describe '#load!' do
    context '4x4 surface and 2 rovers' do
      let!(:file_path) { 'spec/fixtures/scenario_a.txt' }
      let!(:loader) { FileLoader.new(file_path) }

      before(:each) do
        loader.load!
      end

      it 'loads a 4x4 surface' do
        expect(loader.surface.x).to eq(4)
        expect(loader.surface.y).to eq(4)
      end

      it 'loads 2 rovers' do
        expect(loader.rovers.size).to eq(2)
      end

      it 'places the first rover at 3 3' do
        rover = loader.rovers[0]

        expect(rover.coordinates).to eq([3, 3])
      end

      it 'places the first rover facing South' do
        rover = loader.rovers[0]

        expect(rover.facing).to eq('S')
      end

      it 'places the second rover at 1 2' do
        rover = loader.rovers[1]

        expect(rover.coordinates).to eq([1, 2])
      end

      it 'places the second rover facing West' do
        rover = loader.rovers[1]

        expect(rover.facing).to eq('W')
      end

      it 'loads commands to all rovers' do
        loader.load!

        loader.rovers.each do |rover|
          expect(rover.commands).not_to be_empty
        end
      end
    end

    context '6x2 surface and 3 rovers' do
      let!(:file_path) { 'spec/fixtures/scenario_c.txt' }
      let!(:loader) { FileLoader.new(file_path) }

      before(:each) do
        loader.load!
      end

      it 'loads a 6x2 surface' do
        expect(loader.surface.x).to eq(6)
        expect(loader.surface.y).to eq(2)
      end

      it 'loads 3 rovers' do
        expect(loader.rovers.size).to eq(3)
      end

      it 'places the first rover at 5 0' do
        rover = loader.rovers[0]

        expect(rover.coordinates).to eq([5, 0])
      end

      it 'places the first rover facing East' do
        rover = loader.rovers[0]

        expect(rover.facing).to eq('E')
      end

      it 'places the second rover at 0 1' do
        rover = loader.rovers[1]

        expect(rover.coordinates).to eq([0, 1])
      end

      it 'places the second rover facing North' do
        rover = loader.rovers[1]

        expect(rover.facing).to eq('N')
      end

      it 'places the third rover at 4 1' do
        rover = loader.rovers[2]

        expect(rover.coordinates).to eq([4, 1])
      end

      it 'places the third rover facing West' do
        rover = loader.rovers[2]

        expect(rover.facing).to eq('W')
      end

      it 'loads commands to all rovers' do
        loader.rovers.each do |rover|
          expect(rover.commands).not_to be_empty
        end
      end
    end
  end
end
