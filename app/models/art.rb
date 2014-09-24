require 'simple_enum'

class Art < ActiveRecord::Base
	as_enum :category, studies: 0, themes: 1, drawings: 2
	validates :title, presence: true, length: { in: 10...50 }
  validates :description, presence: true
  validates :medium, presence: true
  validates :category_cd, presence: true, :inclusion => { :in => 0..2 }
  validates :year, presence: true, :inclusion => { :in => 2010..Date.today.year }
  validates :width, presence: true, :inclusion => { :in => 10..200 }
  validates :height, presence: true, :inclusion => { :in => 10..200 }
  validates :filename, presence: true

	def process_uploaded_file(file)
		name =  file["original_filename"]
		directory = File.join(Rails.root, ENV["UPLOADED_FILE_ABSOLUTE_PATH"])
		# create the file path
		path = File.join(directory, name)
		# write the file
		File.open(path, "wb") { |f| f.write(file.read) }
    # remove the path(original file path) from here
		self.filename = File.join(ENV["UPLOADED_FILE_RELATIVE_PATH"], name)
	end
end
