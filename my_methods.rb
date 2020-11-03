# rubocop: disable all

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    array = self
    array = array.to_a if array.class == Range
    array = array.to_a if array.class == Hash

    for item in array
      yield item
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    array = self
    array = array.to_a if array.class == Range
    array = array.to_a if array.class == Hash

    for i in (0...array.length)
      yield array[i], i
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    res = []

    for i in array
      res.push(i) if yield i
    end
    res
  end

  def my_all?(arg = nil)
    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    if !block_given? && !arg
      return false if array.include? false or array.include? nil

      return true
    end

    return false if array.empty?

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return false unless array[i].is_a?(arg)
        elsif arg.class == Regexp
          return false if array[i].match(arg).nil?
        else return false if array[i] != arg
        end
      else return false unless yield array[i]
      end
    end

    true
  end

  def my_any?(arg = nil)
    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    return false if array.empty?

    if !block_given? && !arg
      return true if array.include?(true)

      res = array.my_all? do |x|
        !(x != false and !x.nil?)
      end
      return false if res

      return true
    end

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return true if array[i].is_a?(arg)
        elsif arg.class == Regexp
          return true unless array[i].match(arg).nil?
        else return true unless array[i] != arg
        end
      else return true if yield array[i]
      end
    end
    false
  end

  def my_none?(arg = nil)
    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    return true if array.empty?

    if !block_given? && !arg
      res = array.my_all? do |x|
        !(x != false and !x.nil?)
      end

      return true if res

      return false
    end

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          return false if array[i].is_a?(arg)
        elsif arg.class == Regexp
          return false unless array[i].match(arg).nil?
        else
          return false if array[i] == arg
        end
      else return false if yield array[i]
      end
    end

    true
  end

  def my_count(arg = nil)
    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    return array.length if !block_given? && !arg

    return 0 if array.empty?

    count = 0

    for i in 0...array.length
      if arg
        if arg.is_a? Module or arg.is_a? Class
          count += 1 if array[i].is_a?(arg)
        elsif arg.class == Regexp
          count += 1 unless array[i].match(arg).nil?
        else count += 1 unless array[i] != arg
        end
      else count += 1 if yield array[i]
      end
    end

    count
  end

  def my_map(arg = nil)
    return to_enum(:my_map) if !block_given? && !arg

    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    result_array = []

    for item in array
      if arg
        result_array.push(arg.yield(item))
      else result_array.push(yield item)
      end
    end
    result_array
  end

  def my_inject(arg1 = nil, arg2 = nil)
    raise LocalJumpError if !block_given? and !arg1

    array = self
    array = array.to_a if array.class == Range
    array = array.values if array.class == Hash

    if arg1
      if arg2
        result = arg1

        for item in array
          result = result.send(arg2, item)
        end
      elsif arg1.is_a? Symbol
        result = array[0]

        for item in 1...array.length
          result = result.send(arg1, array[item])
        end
      else
        result = arg1

        for item in array
          result = yield result, item
        end
      end
    else

      result = array[0]

      for item in 1...array.length
        result = yield result, array[item]
      end
    end

    result
  end
end

def multiply_els(array)
  array.my_inject do |result, item|
    result * item
  end
end

# rubocop: enable all
