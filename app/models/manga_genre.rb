class MangaGenre < ApplicationRecord
  belongs_to :manga
  belongs_to :genre
end
