class Item
	attr_accessor :title,:status
	def initialize(title,status)
		@title = title
		@status = status
	end
	def complete!
		@status=:done
	end
	def pending?
		@status==:pending
	end
	def to_s
		if(pending?)
			title
		else
			"#{title} #done"
		end
	end
	def self.parse(content)
		if(content.end_with?("#done"))
			Item.new(content.gsub("#done","").strip,:done)
		else
			Item.new(content,:pending)
		end
	end
end