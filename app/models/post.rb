class Post < ApplicationRecord
	mount_uploader :img, ImgUploader
	validates :name, {presence: true}
	validates :problem, {presence: true}
	validates :longitude, {presence: true}
	validates :latitude, {presence: true}
	validates :img, {presence: true}
end
