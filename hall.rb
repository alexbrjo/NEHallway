#!/usr/bin/env ruby

def p(x)
	print x, " \n"
end

class Room 
	def initialize(map,map_xtr,options,reactions)
		@map = map
		@map_xtr = map_xtr
		@options = options
		@reactions = reactions
	end
	def getMap()
		return @map
	end
	def getOptions(i)
		return @options[i]
	end
	def getReactions(i)
		return @reactions[i]
	end
	def getOSize()
		return @options.size
	end
end

class Main
	def initialize()
		p("What is your name?")
		@name = gets.chomp
		@running = true
		@room_num = 0
		@health = 10
		@exp = 0
		@rooms = []
		@rooms[0] = Room.new("There is a door to your right","Its not locked",["open door","die"],["You move to the next room","You are Dead"])
		@rooms[1] = Room.new("There is a door to your left","Its make of wood",["open the door","kill yourself"],["You walk to the next room","You are shot"])
		@rooms[2] = Room.new("There is stone to your right","Its locked",["unlock the door","be killed","smash table"],["You run through the door","You die","the table is smashed"])
		self.loop()
	end
	def loop()
		p("--------THE NEVER ENDING HALLWAY--------")
		while @running do
			if @room_num >= @rooms.size
				p("TGH_ERROR: NO MORE ROOMS")
				self.command("/quit")
				break
			end
			p("------------------TURN------------------")
			p(@rooms[@room_num].getMap())
			i = 0
			while @rooms[@room_num].getOSize() > i do
				p(i.to_s+": "+@rooms[@room_num].getOptions(i).to_s+" ")
				i = i + 1
			end
			answer = gets.chomp
			if answer.start_with?("/")
				self.command(answer)
			else 
				self.interpret(answer)
			end
		end
	end
	def interpret(a)
		p(@rooms[@room_num].getReactions(eval(a)))
		@room_num = @room_num + 1
	end
	def command(c)
		if c == "/getHealth"
			p("Health: "+@health.to_s())
		end
		if c == "/getExp"
			p("Experience: "+@exp.to_s())
		end
		if c == "/getRoom"
			p("Room number: "+@room.to_s())
		end
		if c == "/quit"
			p("quitting")
			@running = false
		end
	end
end

main = Main.new()