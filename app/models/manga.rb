class Manga < ApplicationRecord
	has_many :manga_genres
	has_many :chapters
	has_many :genres, through: :manga_genres

	validates_presence_of :name, :cover_art, :author
	validates_uniqueness_of :name
end
