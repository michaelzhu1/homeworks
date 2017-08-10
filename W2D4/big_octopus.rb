#Quadratic time

def quad_fish(fishes)
  fishes.each_with_index do |fish, idx|
    max_length = true
    fishes.each_with_index do |fish2, jdx|
      next if idx == jdx
      max_length = false if fish2 > fish
    end
    return fish if max_length = true
  end
end

#nlog(n) search
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }
    return self if self.length <= 1
    mid = self.length / 2
    left_sorted = self.take(mid).merge_sort(&prc)
    right_sorted = self.drop(mid).merge_sort(&prc)
    Array.merge(left_sorted, right_sorted, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged += left
    merged += right
    merged
  end
end

def nlog_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end



#n liner time search for biggest fish
def liner_fish(fishes)
  big_fish = fishes.first
  fishes.each do |fish|
    if fish.length > big_fish.length
      big_fish = fish
    end
  end
  return big_fish
end


#linear O(n) search 
def slow_dance(move, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    if move == tile
      return idx
    end
  end
  nil
end

#constant time search O(1)
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(move, tiles_hash )
  tiles_hash[move]
end
