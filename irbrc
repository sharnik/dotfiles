# ActiveRecord SQL logging to console:
if defined? ActiveRecord 
	AR = ActiveRecord::Base
	AR.logger=Logger.new(STDOUT)
	AR.clear_all_connections! 
end

# Copy/paste/eval paste:
def ep
  IRB.CurrentContext.workspace.evaluate(self, paste)
end
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end
def paste
  `pbpaste`
end

