# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../computer'

describe Computer do
  subject(:result) { described_class.new(id, DS.new) }

  let(:info) { 'test' }
  let(:price) { 100 }
  let(:id) { 1 }
  let(:ds) do
    instance_double(
      DS,
      get_mouse_info: info, get_mouse_price: price,
      get_cpu_info: info, get_cpu_price: price,
      get_keyboard_info: info, get_keyboard_price: price
    )
  end

  before do
    expect(DS).to(receive(:new).and_return(ds))
  end

  it { is_expected.to respond_to(:mouse) }
  it { is_expected.to respond_to(:cpu) }
  it { is_expected.to respond_to(:keyboard) }
  it { is_expected.to_not respond_to(:random) }

  describe 'successful' do
    describe '#mouse' do
      let(:ds) { instance_double(DS, get_mouse_info: info, get_mouse_price: price) }
      let(:output) { "* mouse: test ($#{price})" }

      it 'returns test' do
        expect(result.mouse).to(eq(output))
      end
    end

    describe '#cpu' do
      let(:ds) { instance_double(DS, get_cpu_info: info, get_cpu_price: price) }
      let(:output) { "* cpu: test ($#{price})" }

      it 'returns test' do
        expect(result.cpu).to(eq(output))
      end
    end

    describe '#keyboard' do
      let(:ds) { instance_double(DS, get_keyboard_info: info, get_keyboard_price: price) }
      let(:output) { "* keyboard: test ($#{price})" }

      it 'returns test' do
        expect(result.keyboard).to(eq(output))
      end
    end
  end

  describe 'data store item not found' do
    describe '#none' do
      let(:ds) { instance_double(DS, get_mouse_info: info, get_mouse_price: price) }
      let(:output) { 'none: N/A ($N/A)' }

      it 'returns test' do
        expect(result.none).to(eq(output))
      end
    end
  end
end
