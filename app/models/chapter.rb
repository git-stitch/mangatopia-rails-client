class Chapter < ApplicationRecord
  belongs_to :manga
  has_many :pages
end
