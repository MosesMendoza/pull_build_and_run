require 'yaml'

all_pkgs = {}

Dir["*.yaml"].each do |f|
  all_pkgs.store(f.split('-')[0..2].join, YAML.load_file(f))
end

size = all_pkgs.keys.size
count = 0
countin = 0

while count < size
  countin = 0
  while countin < size
    diff = all_pkgs[all_pkgs.keys[count]].keys - all_pkgs[all_pkgs.keys[countin]].keys
    puts "diff between #{all_pkgs.keys[count]} and #{all_pkgs.keys[countin]} is #{diff.join(',')}"
    countin = countin + 1
  end
  count = count + 1
end

