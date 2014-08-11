#!/usr/bin/env ruby

def minuteround(date)
    date =~ /"(.*)(\d{2}):\d{2} (A|P)M/;
    minutes = ($2).to_i/5;
    minutes = sprintf("%02d", minutes * 5);
	return "#{$1}#{minutes}:00 #{$3}M";
end

timecount = Hash.new;

while(line = gets)
	row = line.split(',');
	fixed = minuteround(row[3]);
	timecount[fixed] = timecount.has_key?(fixed) ? timecount[fixed] + 1 : 1;
end

timecount.each {|key, value| puts "#{key}, #{value}" }
