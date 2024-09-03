class LinkedList
  class Node
    attr_accessor :key, :value, :next

    def initialize(key, value)
      @key = key
      @value = value
      @next = nil
    end
  end

  def initialize
    @head = nil
  end

  def find(key)
    current = @head
    while current
      return current if current.key == key
      current = current.next
    end
    nil
  end

  def append(key, value)
    if @head.nil?
      @head = Node.new(key, value)
    else
      current = @head
      current = current.next while current.next
      current.next = Node.new(key, value)
    end
  end

  def remove(key)
    return nil if @head.nil?

    if @head.key == key
      removed_node = @head
      @head = @head.next
      return removed_node
    end

    current = @head
    while current.next && current.next.key != key
      current = current.next
    end

    if current.next
      removed_node = current.next
      current.next = current.next.next
      removed_node
    else
      nil
    end
  end

  def keys
    keys = []
    current = @head
    while current
      keys << current.key
      current = current.next
    end
    keys
  end

  def values
    values = []
    current = @head
    while current
      values << current.value
      current = current.next
    end
    values
  end

  def entries
    entries = []
    current = @head
    while current
      entries << [current.key, current.value]
      current = current.next
    end
    entries
  end
end

