#!/usr/bin/env ruby - w
class Player
	def initialize()
		@health = 10
		@hand = ""
		@xp = 0
	end
	def getXp() 
		return @xp
	end
	def getHealth() 
		return @health
	end
	def getHand() 
		return @Hand
	end
	
	def giveXp(n) 
		@xp = @xp + n
	end
	def giveHealth(n) 
		@health = @health + n
	end
	def setHand(n) 
		@Hand = n
	end
end