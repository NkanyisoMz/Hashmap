 require_relative 'Hashmap.rb' # Ensure you have the correct file name for your HashMap class

# Create a new instance of HashMap
test = Hashmap.new

# Populate the HashMap
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# This should trigger a resize due to exceeding the load factor
test.set('moon', 'silver')

# Overwriting some nodes
test.set('apple', 'green')
test.set('banana', 'blue')

# Test other methods
puts test.get('apple')       # Should output "green"
puts test.has?('moon')       # Should output true
puts test.remove('lion')     # Should output "golden" and remove 'lion'
puts test.length             # Should output the number of keys
puts test.keys.inspect       # Should output all the keys
puts test.values.inspect     # Should output all the values
puts test.entries.inspect    # Should output all key-value pairs

# Clear the HashMap
test.clear
puts test.length             # Should output 0, as the hashmap is cleared
