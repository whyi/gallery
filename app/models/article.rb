require 'simple_enum'

class Article < ActiveRecord::Base
	as_enum :category, studies: 0, themes: 1, drawings: 2
end
