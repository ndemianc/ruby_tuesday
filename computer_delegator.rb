# frozen_string_literal: true

# module ComputerDelegator
module ComputerDelegator
  private

  def method_missing(method, *args)
    result(get_info(method, args), get_price(method, args)) do |x|
      x.to_i >= price ? "* #{method}" : method.to_s
    end
  end

  def respond_to_missing?(method, include_private = false)
    (
      data_source.respond_to?("get_#{method}_info".to_sym) && data_source.respond_to?("get_#{method}_price".to_sym)
    ) || super
  end

  def get_info(method, *args)
    return 'N/A' unless data_source.respond_to?("get_#{method}_info".to_sym)

    data_source.send("get_#{method}_info".to_sym, args)
  end

  def get_price(method, *args)
    return 'N/A' unless data_source.respond_to?("get_#{method}_price".to_sym)

    data_source.send("get_#{method}_price".to_sym, args)
  end

  def result(info, price)
    "#{yield(price)}: #{info} ($#{price})"
  end
end
