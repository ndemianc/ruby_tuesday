# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../ds'

describe DS do
  subject(:result) { described_class.new }
  let(:workstation) { 1 }

  describe 'instance methods' do
    it 'returns successfully' do
      expect(result.get_cpu_info(workstation)).to(eq('2.9 Ghz quad-core'))
      expect(result.get_cpu_price(workstation)).to(eq(120))
      expect(result.get_mouse_info(workstation)).to(eq('Wireless Touch'))
      expect(result.get_mouse_price(workstation)).to(eq(60))
      expect(result.get_keyboard_info(workstation)).to(eq('Standard US'))
      expect(result.get_keyboard_price(workstation)).to(eq(20))
      expect(result.get_display_info(workstation)).to(eq('LED 1980x1024'))
      expect(result.get_display_price(workstation)).to(eq(150))
    end
  end
end
