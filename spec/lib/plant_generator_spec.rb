# spec/lib/plant_generator_spec.rb
require 'rails_helper'

RSpec.describe PlantGenerator do
  describe '.new' do
    context 'when plant name is provided' do
      let(:plant_name) { :flower1 }

      it 'generates a plant with the provided name' do
        plant = PlantGenerator.new(plant_name)
        expect(plant[:name]).to eq('')
      end

      it 'generates a plant with the correct attributes' do
        plant = PlantGenerator.new(plant_name)
        expect(plant[:type]).to eq('flower1')
        expect(plant[:lifespan]).to eq(86400000)
        expect(plant[:planted]).to be_within(1).of(Time.now.to_i)
        expect(plant[:phases][:stem][:color]).to eq([[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]])
        expect(plant[:phases][:stem][:stemWidth]).to eq([0.4, 0.4, 0.4, 0.4, 0.4])
        expect(plant[:phases][:stem][:path]).to be_a(Array)
        expect(plant[:phases][:bloom][:color]).to be_a(Array)
        expect(plant[:phases][:bloom][:petalCount]).to eq([1, 1, 1, 1, 1])
        expect(plant[:phases][:bloom][:rotation]).to be_a(Array)
      end
    end

    context 'when plant name is not provided' do
      it 'generates a plant with an empty name' do
        plant = PlantGenerator.new
        expect(plant[:name]).to be_empty
      end
    end
  end

  describe '.generate_random_values' do
    let(:array) { [0.1, 0.2, 0.3, 0.4, 0.5] }

    it 'generates an array with the first element unchanged' do
      random_values = PlantGenerator.generate_random_values(array)
      expect(random_values.first).to eq(0.1)
    end

    it 'generates an array with random values between adjacent elements' do
      random_values = PlantGenerator.generate_random_values(array)
      expect(random_values[1]).to be_between(0.1, 0.2)
      expect(random_values[2]).to be_between(0.2, 0.3)
      expect(random_values[3]).to be_between(0.3, 0.4)
    end

    it 'generates an array with a maximum of 5 elements' do
      long_array = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7]
      random_values = PlantGenerator.generate_random_values(long_array)
      expect(random_values.size).to eq(6)
    end

    context 'when either a or b is nil' do
      let(:array_with_nil) { [0.1, nil, 0.3, 0.4, 0.5] }

      it 'adds the non-nil value to the result array' do
        random_values = PlantGenerator.generate_random_values(array_with_nil)
        expect(random_values.size).to eq(5)
        expect(random_values[0]).to eq(0.1)
        expect(random_values[1]).to be_a(Float)
        expect(random_values[2]).to be_a(Float)
        expect(random_values[3]).to be_a(Float)
        expect(random_values[4]).to be_a(Float)
      end
    end
  end

  describe '.generate_bloom_color' do
    it 'generates a random RGB color with a total value greater than 200' do
      allow(PlantGenerator).to receive(:rand).and_return(50, 60, 70, 80, 90, 100)

      bloom_color = PlantGenerator.generate_bloom_color
      expect(bloom_color).to be_an(Array)
      expect(bloom_color.size).to eq(3)
      expect(bloom_color.all? { |value| value.between?(0, 255) }).to be(true)
      expect(bloom_color.sum).to be > 200
    end
  end
end
