require 'simple_enum'

class Art < ActiveRecord::Base
	as_enum :category, studies: 0, themes: 1, drawings: 2
	validates :title, presence: true, length: { in: 4...50 }
  validates_presence_of :description
  validates_presence_of :medium
  validates :category_cd, presence: true, :inclusion => { :in => 0..2 }
  validates :year, presence: true, :inclusion => { :in => 2010..Date.today.year }
  validates :width, presence: true, :inclusion => { :in => 10..200 }
  validates :height, presence: true, :inclusion => { :in => 10..200 }
  validates_presence_of :user_id
  mount_uploader :filename, ImageUploader
  validates_presence_of :filename
  belongs_to :user

  def self.find_all_by_category(category)
    Art.where(:category_cd=>Art.categories[category]).all
  end
end
