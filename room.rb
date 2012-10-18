#!/usr/bin/env ruby - w
class Room 
	def initialize(id,desc,extr,options)
		@id = id 
		@desc = desc
		@extr = extr
		@options = options
	end
	def getId
		return @id
	end
	def getDesc
		return @desc
	end
	def getExtr
		return @extr
	end
	def getOptions
		return @options
	end
end