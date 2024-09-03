require_relative 'LinkedList.rb'
class Hashmap
  attr_accessor :buckets, :size
  def initialize
    @buckets = Array.new(16) {LinkedList.new}
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code % @buckets.length
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
  
    bucket = @buckets[index]
    node = bucket.find(key)
    if node
      node.value = value
    else
      bucket.append(key, value)
      @size += 1
      resize if load_factor_exceeded?
    end
  end
  
  

  def get(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
  
    bucket = @buckets[index]
    node = bucket.find(key)
    node ? node.value : nil
  end
  
  

  def has?(key)
    !get(key).nil?
  end
  

  def remove(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
  
    bucket = @buckets[index]
    node = bucket.remove(key)
    @size -= 1 if node
    node ? node.value : nil
  end
  
  

  def length
    @size
  end

  def clear
    @buckets = Array.new(16) { LinkedList.new }
    @size = 0
  end
  

  def keys
    @buckets.flat_map { |bucket| bucket.keys }
  end
  

  def values
    @buckets.flat_map { |bucket| bucket.values }
  end
  

  def entries
    @buckets.flat_map { |bucket| bucket.entries }
  end

  def load_factor
    @size.to_f / @buckets.length
  end
  
  def load_factor_exceeded?
    load_factor > 0.75
  end
  
  def resize
    old_buckets = @buckets
    @buckets = Array.new(@buckets.length * 2) { LinkedList.new }
    @size = 0
  
    old_buckets.each do |bucket|
      bucket.entries.each do |key, value|
        set(key, value)
      end
    end
  end
  
  
 
end
