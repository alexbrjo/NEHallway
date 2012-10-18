#!/usr/bin/env ruby - w
class Map
	def initialize(doc)
		@rooms = []
		doc.elements.each("hallway/room") {|room| 
			id = 0
			desc = "default"
			extr = "default"
			options = []
			room.elements.each("id") {|i| id = eval(i.text)}
			room.elements.each("description") {|i| desc = i.text}
			room.elements.each("extra") {|i| extr = i.text}
			room.elements.each("options/action") {|action|
				aid = 0
				opt = ""
				out = ""
				exc = ""
				action.elements.each("aid"){|i| aid = eval(i.text)}
				action.elements.each("opt"){|i| opt = i.text}
				action.elements.each("out"){|i| out = i.text}
				action.elements.each("exc"){|i| exc = i.text}
				options += [Hash["aid" => aid,"opt" => opt,"out" => out,"exc" => exc]]
			}
			@rooms[id] = Room.new(id,desc,extr,options) 
		}
		
	end
	def getSize() 
		return @rooms.size
	end
	def getRoom(n) 
		return @rooms[n]
	end
end