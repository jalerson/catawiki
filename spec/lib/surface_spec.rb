RSpec.describe Surface do
  context 'initialization' do
    context 'positive x and y' do
      it 'builds an instance' do
        surface = Surface.new(5, 2)

        expect(surface.x).to eq(5)
        expect(surface.y).to eq(2)
      end
    end

    context 'x is zero' do
      it 'raises an ArgumentError' do
        expect do
          Surface.new(0, 2)
        end.to raise_error(ArgumentError)
      end
    end

    context 'y is negative' do
      it 'raises an ArgumentError' do
        expect do
          Surface.new(3, -1)
        end.to raise_error(ArgumentError)
      end
    end
  end
end
