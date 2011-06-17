# Ustawienia, żeby było widać nazwę środowiska w konsoli railsowej
IRB.conf[:PROMPT][:CUSTOM] = {
 :PROMPT_N => "[#{(ENV["RAILS_ENV"] || 'irb').capitalize}]>> ",
 :PROMPT_I => "[#{(ENV["RAILS_ENV"] || 'irb').capitalize}]>> ",
 :PROMPT_S => nil,
 :PROMPT_C => "[#{(ENV["RAILS_ENV"] || 'irb').capitalize}]?> ",
 :RETURN => "=> %s\n"
}

# Set default prompt
IRB.conf[:PROMPT_MODE] = :CUSTOM

# Bogate logowanie do konsoli:
script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end

# ActiveRecord SQL logging to console:
if defined? ActiveRecord 
	AR = ActiveRecord::Base
	AR.logger=Logger.new(STDOUT)
	AR.clear_all_connections! 
end

# Vi interactive editor - http://vimcasts.org/episodes/running-vim-within-irb/
require 'interactive_editor'

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
