Gem.loaded_specs['tude_tester'].dependencies.each do |d|
  require d.name
end

require "tude_tester/engine"

module TudeTester
  # Your code goes here...
end
