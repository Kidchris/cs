def merger(first, second, array = [])
  (first.length + second.length).times {
    array.push second.shift if first.empty?
    array.push first.shift if second.empty?
    compare = first <=> second
    array.push first.shift if compare == -1
    array.push first.shift if compare == 0
    array.push second.shift if compare == 1
  }
  array.compact!
end

def merge_sort(array)
  return array if array.length < 2
  first_array = merge_sort(array[0...array.length / 2])
  second_array = merge_sort(array[array.length / 2...array.length])
  merger(first_array, second_array)
end

p merge_sort([1, 5, 6, 2, 4, 9, 0])
