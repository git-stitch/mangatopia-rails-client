class ChaptersController < ApplicationController
	def show
		@chapter = Chapter.find(params[:id])
		@curr_manga = @chapter.manga

		###########################################
		@prev_chapter = Chapter.find_by(chapter_number:(@chapter.chapter_number-1),manga_id:@curr_manga.id)
		###########################################
		@next_chapter = Chapter.find_by(chapter_number:(@chapter.chapter_number+1),manga_id:@curr_manga.id)
		###########################################
		@first_chapter = @chapter.manga.chapters.last
		############################################
		@last_chapter = @chapter.manga.chapters.first
		############################################
		
		@pages = @chapter.pages
		if @pages.length > 0
			@chapter
		else
			#########################
			@manga = MangaScraper.new
			pages_arr = @manga.chapter_pages(@chapter.chapter_url,@chapter.id)
			pages_arr.each do |page|
				Page.create(page)
			end	
			@chapter
			#########################
		end
	end

end