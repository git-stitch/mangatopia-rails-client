class Genre < ApplicationRecord
	has_many :manga_genres
	has_many :mangas, through: :manga_genres
end
