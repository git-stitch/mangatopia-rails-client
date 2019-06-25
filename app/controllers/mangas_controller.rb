class MangasController < ApplicationController
	def index
		@mangas = Manga.all
		@genres = Genre.all
	end

	def show
		found_manga
	end

	def new
		@manga = Manga.new
		@existing_manga = Manga.new
		@manga_searched = MangaScraper.new
	end

	def create
		#grabs manga info with MangaScraper
		######################################
		@chosen_manga = MangaScraper.new
		url = @chosen_manga.manga_search(manga_params[:name])
		if url == nil
			@manga = Manga.new
			return render :new, :error => "Unable to locate Manga!"
		end

		manga_content = @chosen_manga.manga_info(url)
		manga_content[:manga][:manga_url] = url
		######################################
		
		@manga = Manga.create(manga_content[:manga])
		if @manga.valid?	
			# creates manga chapter list
			######################################
			chapters_arr = @chosen_manga.chapters_list(url,@manga.id)
			chapters_arr.each do |chapter|
				Chapter.create(chapter)
			end
			######################################
			@chapters = Chapter.all

			# creates manga genre association
			######################################
			manga_content[:genres].each do |genre|
				@genre = Genre.find_by(name:genre.downcase)
				MangaGenre.create(manga_id:@manga.id,genre_id:@genre.id)
			end
			######################################
			redirect_to @manga
		else
			render :new
		end
	end

	def destroy
		
	end

	private
	def manga_params
		params.require(:manga).permit(:cover_art,:name,:author)
	end

	def found_manga
		@manga = Manga.find(params[:id])
	end
end
