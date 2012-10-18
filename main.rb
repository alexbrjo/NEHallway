#!/usr/bin/env ruby - w
class Main
	def initialize(map, console, interpreter, player)
		@player = player
		@map = map
		@console = console
		@interpreter = interpreter
		@running = true
		@pos = 1
	end
	
	def loop()
		p("--------THE NEVER ENDING HALLWAY--------")
		while @running do
			if @pos >= @map.getSize()
				p("ERROR: NO MORE ROOMS")
				self.command("/quit")
				break
			end
			p("------------------TURN------------------")
			room = @map.getRoom(@pos)
			options = room.getOptions
			p(room.getDesc)
			options.each {|o|
				p(o["aid"].to_s+": "+o["opt"]+" ")
			}
			answer = gets.chomp
			if answer.start_with?("/")
				self.command(answer)
			else 
				answer = eval(answer)-1
				option = options[answer]
				p(option["out"])
				self.command(option["exc"])
			end
		end
	end
	
	def command(c)
		if c == "/getRoom"
			p("Room number: "+@pos.to_s())
		end
		if c == "/quit"
			p("quitting")
			@running = false
		end
		if c == "/next"
			@pos += 1
		end
		if c == "/kill"
			@running = false
		end
		if c == "/dam"
			@player.giveHealth(-1)
			p("Health: " + @player.getHealth().to_s())
		end
	end
end