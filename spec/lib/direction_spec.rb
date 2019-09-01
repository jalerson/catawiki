RSpec.describe Direction do
  describe 'initialization' do
    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'faces North' do
        expect(direction.facing).to eq('N')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'faces East' do
        expect(direction.facing).to eq('E')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'faces West' do
        expect(direction.facing).to eq('W')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'faces South' do
        expect(direction.facing).to eq('S')
      end
    end

    context 'facing Unknown' do
      it 'raises ArgumentError' do
        expect do
          Direction.new('U')
        end.to raise_error(ArgumentError)
      end
    end
  end

  context '#left!' do
    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'turns to West' do
        direction.left!

        expect(direction.facing).to eq('W')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'turns to North' do
        direction.left!

        expect(direction.facing).to eq('N')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'turns to South' do
        direction.left!

        expect(direction.facing).to eq('S')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'turns to East' do
        direction.left!

        expect(direction.facing).to eq('E')
      end
    end
  end

  context '#right!' do
    context 'facing North' do
      let!(:direction) { Direction.new('N') }

      it 'turns to East' do
        direction.right!

        expect(direction.facing).to eq('E')
      end
    end

    context 'facing East' do
      let!(:direction) { Direction.new('E') }

      it 'turns to South' do
        direction.right!

        expect(direction.facing).to eq('S')
      end
    end

    context 'facing West' do
      let!(:direction) { Direction.new('W') }

      it 'turns to North' do
        direction.right!

        expect(direction.facing).to eq('N')
      end
    end

    context 'facing South' do
      let!(:direction) { Direction.new('S') }

      it 'turns to West' do
        direction.right!

        expect(direction.facing).to eq('W')
      end
    end
  end

  describe '#to_s' do
    let!(:direction) { Direction.new('S') }

    it 'returns facing' do
      expect(direction.to_s).to eq('S')
    end
  end
end
