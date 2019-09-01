RSpec.describe Position do
  let!(:surface) { Surface.new(5, 5) }
  let!(:x) { 1 }
  let!(:y) { 2 }
  let!(:position) { Position.new(x, y, surface: surface) }

  describe 'initialization' do
    context 'with valid arguments' do
      it 'assigns x and y' do
        expect(position.x).to eq(x)
        expect(position.y).to eq(y)
      end
    end

    context 'negative x' do
      it 'raises InvalidPositionError' do
        expect do
          Position.new(-x, y, surface: surface)
        end.to raise_error(InvalidPositionError)
      end
    end

    context 'negative y' do
      it 'raises InvalidPositionError' do
        expect do
          Position.new(x, -y, surface: surface)
        end.to raise_error(InvalidPositionError)
      end
    end

    context 'x is out of surface' do
      it 'raises InvalidPositionError' do
        expect do
          Position.new(10, y, surface: surface)
        end.to raise_error(InvalidPositionError)
      end
    end

    context 'y is out of surface' do
      it 'raises InvalidPositionError' do
        expect do
          Position.new(x, 10, surface: surface)
        end.to raise_error(InvalidPositionError)
      end
    end
  end

  describe '#next' do
    context 'next position to North' do
      it 'returns position [x, (y + 1)]' do
        expect(position.next('N').coordinates).to eq([x, (y + 1)])
      end
    end

    context 'next position to East' do
      it 'returns position [(x + 1), y]' do
        expect(position.next('E').coordinates).to eq([(x + 1), y])
      end
    end

    context 'next position to West' do
      it 'returns position [(x - 1), y]' do
        expect(position.next('W').coordinates).to eq([(x - 1), y])
      end
    end

    context 'next position to South' do
      it 'returns position [x, (y - 1)]' do
        expect(position.next('S').coordinates).to eq([x, (y - 1)])
      end
    end

    context 'next position to out of surface' do
      let!(:surface_corner_position) { Position.new(5, 5, surface: surface) }

      it 'raises an InvalidPositionError' do
        expect do
          surface_corner_position.next('N')
        end.to raise_error(InvalidPositionError)
      end
    end
  end

  describe '#coordinates' do
    it 'returns an array of coordinates' do
      expect(position.coordinates).to contain_exactly(x, y)
    end
  end

  describe '#to_s' do
    it 'returns x and y' do
      expect(position.to_s).to eq("#{position.x} #{position.y}")
    end
  end
end
