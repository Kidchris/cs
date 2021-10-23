class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

class LinkedNode
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def to_s
    if block_given?
      current = @head
      while current
        yield current
        current = current.next
      end
    else
      current = @head
      while current
        print(current.data, " --> ")
        current = current.next
      end
      print ("nil\n")
    end
  end

  def header
    puts @head.data
  end

  def tail
    current = @head
    while current
      following = current.next
      puts current.data if following.nil?
      current = current.next
    end
  end

  def size
    current = @head
    size = 0
    while current
      size += 1
      current = current.next
    end
    return size
  end

  def contain?(value)
    current = @head
    while current
      return true if current.data == value
      current = current.next
    end
    return false
  end

  def find(value)
    current = @head
    i = 0
    while current
      return i if current.data == value
      i += 1
      current = current.next
    end
    return nil
  end

  def remove_at(index)
    current = @head
    i = 0
    while current
      previous = current
      following = current.next
      current = current.next
      if index == 0
        self.head = following
        return following.next = following.next
      end
      if i == index - 1
        return previous.next = following ? following.next : nil
      end
      i += 1
    end
    puts "Out of range"
  end

  def pop
    current = @head
    i = 0
    while current
      previous = current
      current = current.next
      if i + 2 == self.size
        previous.next = nil
      end
      i += 1
    end
  end

  def prepend(data)
    new_data = Node.new(data)
    new_data.next = self.head
    self.head = new_data
  end

  def append(value)
    current = @head
    node = Node.new(value)

    while current
      return current.next = node if current.next.nil?
      current = current.next
    end
  end

  def insert_at(value, index)
    current = @head
    data = Node.new(value)
    i = 0
    while current
      previous = current
      following = current.next
      current = current.next

      if i == index - 1
        previous.next = data
        return data.next = current
      end
      i += 1
    end
  end
end

linked_list = LinkedNode.new()

first = Node.new(1)
second = Node.new(2)
third = Node.new(3)

linked_list.head = first
first.next = second
second.next = third

linked_list.prepend(0)
linked_list.append(4)
linked_list.append(5)
linked_list.insert_at(6, 2)
linked_list.remove_at(2)
linked_list.header
linked_list.pop
linked_list.tail
linked_list.to_s
