require 'simple_enum'

class Article < ActiveRecord::Base
	as_enum :category, studies: 0, themes: 1, drawings: 2
	validates :title, presence: true, allow_blank: false, length: { in: 10...50 }
  validates :description, presence: true, allow_blank: false
  validates :category_cd, presence: true, allow_blank: false, :inclusion => { :in => 0..2 }
  validates :width, presence: true, allow_blank: false, :inclusion => { :in => 10..200 }
  validates :height, presence: true, allow_blank: false, :inclusion => { :in => 10..200 }
  validates :filename, presence: true, allow_blank: false

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
