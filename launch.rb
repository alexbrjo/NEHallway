#!/usr/bin/env ruby - w
require 'rexml/document'
include REXML

load 'room.rb'
load 'map.rb'
load 'main.rb'
load 'player.rb'

#print "Path to XML file \n"
#path = gets.chomp

file = File.new("room.xml")#path)
doc = Document.new(file)

def p(s)
	print s.to_s + "\n"
end

console = ""
interpreter = ""
map = Map.new(doc)
player = Player.new()
main = Main.new(map, console, interpreter, player)
main.loop()

