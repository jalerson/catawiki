RSpec.describe Rover do
  let!(:surface) { Surface.new(5, 4) }
  let!(:position) { Position.new(1, 2, surface: surface) }

  describe 'initialization' do
    let!(:direction) { Direction.new('N') }

    it 'builds a Rover instance' do
      rover = Rover.new(position, direction)

      expect(rover.to_s).to eq('1 2 N')
    end
  end

  describe '#move!' do
    let(:rover) { Rover.new(position, direction) }

    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'moves to 1 3 N' do
        rover.move!

        expect(rover.to_s).to eq('1 3 N')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'moves to 2 2 E' do
        rover.move!

        expect(rover.to_s).to eq('2 2 E')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'moves to 0 2 W' do
        rover.move!

        expect(rover.to_s).to eq('0 2 W')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'moves to 1 1 S' do
        rover.move!

        expect(rover.to_s).to eq('1 1 S')
      end
    end

    context 'moves beyond of surface' do
      let!(:direction) { Direction.new('W') }

      it 'raises InvalidMovementError' do
        expect do
          2.times { rover.move! }
        end.to raise_error(InvalidMovementError)
      end
    end
  end

  context '#turn_left!' do
    let(:rover) { Rover.new(position, direction) }

    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'turns to West' do
        rover.turn_left!

        expect(rover.facing).to eq('W')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'turns to North' do
        rover.turn_left!

        expect(rover.facing).to eq('N')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'turns to South' do
        rover.turn_left!

        expect(rover.facing).to eq('S')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'turns to East' do
        rover.turn_left!

        expect(rover.facing).to eq('E')
      end
    end
  end

  context '#turn_right!' do
    let(:rover) { Rover.new(position, direction) }

    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'turns to East' do
        rover.turn_right!

        expect(rover.facing).to eq('E')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'turns to South' do
        rover.turn_right!

        expect(rover.facing).to eq('S')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'turns to North' do
        rover.turn_right!

        expect(rover.facing).to eq('N')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'turns to West' do
        rover.turn_right!

        expect(rover.facing).to eq('W')
      end
    end
  end
end
