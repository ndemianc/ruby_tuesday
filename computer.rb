# frozen_string_literal: true

require_relative 'ds'
require_relative 'computer_delegator'

# Computer class
class Computer
  include ComputerDelegator

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    @price = 1
  end

  private

  attr_reader :id, :data_source, :price
end

if __FILE__ == $PROGRAM_NAME
  ds = DS.new
  workstation1 = Computer.new(1, ds)
  p workstation1.mouse
  p workstation1.cpu
  p workstation1.keyboard
end
