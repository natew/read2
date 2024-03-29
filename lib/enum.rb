# From discourse
# https://raw.github.com/discourse/discourse/master/lib/enum.rb

class Enum < Hash
  # Public: Initialize an enum.
  #
  # members - the array of enum members. May contain a hash of options:
  #           :start   - the number of first enum member. Defaults to 1.
  #
  # Examples
  #
  #   FRUITS = Enum.new(:apple, :orange, :kiwi)
  def initialize(*members)
    super({})

    options = members.extract_options!
    start = options.fetch(:start) { 1 }

    update Hash[members.zip(start..members.count + start)]
  end

  # Public: Access the number/value of member.
  #
  # ids_or_value - number or value of member.
  #
  # Returns value if number was provided, and number if value was provided.
  def [](id_or_value)
    fetch(id_or_value) { key(id_or_value) }
  end

  # Public: Check if supplied member is valid.
  def valid?(member)
    has_key?(member)
  end

  # Public: Create a subset of enum, only include specified keys.
  def only(*keys)
    dup.tap do |d|
      d.keep_if { |k| keys.include?(k) }
    end
  end

  # Public: Create a subset of enum, preserve all items but specified ones.
  def except(*keys)
    dup.tap do |d|
      d.delete_if { |k| keys.include?(k) }
    end
  end
end