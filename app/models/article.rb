require 'simple_enum'

class Article < ActiveRecord::Base
	as_enum :category, studies: 0, themes: 1, drawings: 2
	# validates :name, presence: true
	# validates :name, presence: true
	# validates :name, presence: true
	# validates :name, presence: true
	def process_uploaded_file(file)
		name =  file.original_filename
		directory = File.join(Rails.root, ENV["UPLOADED_FILE_PATH"])
		# create the file path
		path = File.join(directory, name)
		# write the file
		File.open(path, "wb") { |f| f.write(file.read) }
		self.filename = path
	end
end
