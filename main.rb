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
			
			# Excutes cmds
			if answer.start_with?("/")
				self.command(answer)
			
			# If text isn't a cmd, uses as a choice
			else 
				answer = eval(answer)-1
				#TODO safeguard for wrong text entry
				#if answer is a number && <= options.length
					option = options[answer]
					p(option["out"])
					self.command(option["exc"])
				#end
			end
			sleep 1
		end
	end
	
	def command(c)
	    if c == "/info"
            p(@map.getInfo())
		end
		if c == "/getRoom"
			p("Room number: "+@pos.to_s())
		end
		if c == "/quit"
			quit()
		end
		if c == "/next"
			@pos += 1
		end
        if c == "/back"
			@pos -= 1
		end
		if c == "/kill"
            p(@map.getLose())
			quit()
		end
        if c == "/done"
            p(@map.getWin())
			quit()
		end
		if c == "/dam"
			@player.giveHealth(-1)
			p("Health: " + @player.getHealth().to_s())
		end
        if c == "/heal"
			@player.giveHealth(1)
			p("Health: " + @player.getHealth().to_s())
		end
	end
	
	def quit()
		p("Quitting NEH: " + @map.getName())
		@running = false
		p("Quit. Thank you for playing")
		p("----------------------------------------")
	end
	
end