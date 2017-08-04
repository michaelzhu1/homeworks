require 'byebug'
class Stack
  def initialize
    @ivar = []
  end

  def add(el)
    @ivar.push(el)
  end

  def remove
    @ivar.pop
  end

  def show
    @ivar
  end
end


class Queue
  def initialize
    @line=[]
  end

  def enqueue(el)
    @line.push(el)
  end

  def dequeue
    @line.shift
  end

  def show
    @line
  end

end


class Map
  def initialize
    @pair = []
  end

  def assign(key, value)
    if lookup(key)
      remove(key)
      @pair << [key, value]
    else
      @pair << [key, value]
    end
  end

  def lookup(key)
    @pair.any? {|el| el[0]==key}
  end

  def remove(key)
    @pair.each do |pair|
      if pair[0] == key
        @pair.delete(pair)
      end
    end
  end

  def show
    @pair
  end

end
