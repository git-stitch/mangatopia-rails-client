require 'nokogiri'
require 'open-uri'

class MangaScraper
	@base_url = "https://manganelo.com/"
	@base_search_url = @base_url+"search/"
	@manga_show_page = @base_url+"manga/"

	# search for manga on manganelo
	def manga_search(manga)
		#format manga query 
		if manga.include?(" ")
			manga = manga.split(" ").join("_")
		end

		new_html = open("https://manganelo.com/search/#{manga}")
		new_doc = Nokogiri::HTML(new_html)
		search = new_doc.css(".story_item")

		# found manga show page from search
		if search.at_css("a") == nil
			return nil
		else
			found_manga_homepage = search.at_css("a").attributes["href"].value
		end
	end

	def manga_info(manga)
		manga_bio = {:manga=>{}}
		html = open(manga)
		doc = Nokogiri::HTML(html)

		# find the manga cover art
		cover_art = doc.css(".manga-info-top").at_css("img")
		# set this to the a hash for mass assignment
		manga_bio[:manga][:cover_art] = cover_art.attributes["src"].value
		# name
		name = doc.css(".manga-info-text").at_css("h1")
		manga_bio[:manga][:name] = name.children.text
		# author
		author = doc.css(".manga-info-text")
		manga_bio[:manga][:author] = author.at_css("a").children.text

		# genres
		status = doc.css(".manga-info-text").css("li")
		unformatted_genres = ""
		status.text.split("\n").each do |item|
			regex = (/[A-Za-z],/)
			count = 0
			if item.match(regex)
				count +=1
				if count == 1
					unformatted_genres = item
				end
			end
		end

		genres = unformatted_genres.split(",").map do |genre|
			genre.gsub(" ", "")
		end

		manga_bio[:genres] = genres
		manga_bio
	end

	# grabs manga chapter list from manganelo
	def chapters_list(manga_home_page,manga_id)
		chapters_html = open(manga_home_page)
		chapters_doc = Nokogiri::HTML(chapters_html)
		chapters = chapters_doc.css(".chapter-list").css(".row")

		chapters_url_arr = []
		chapters.each do |item|
			chapter_hash = {}
			curr_chapter_url = item.at_css("a").attributes["href"].value 

			chapter_hash[:chapter_url] = curr_chapter_url
			# logic for finding the chapter number
			chapter_number = curr_chapter_url.split("_").last.to_i

			chapter_hash[:chapter_number] = chapter_number

			chapter_hash[:manga_id] = manga_id

			 chapters_url_arr << chapter_hash 
		end
		chapters_url_arr
	end

	#grabs chapter img urls from manganelo 
	def chapter_pages(chapter,chapter_id)		
		html = open(chapter)
		doc = Nokogiri::HTML(html)
		chapter_raw = doc.css("img")

		manga_chapter_pages_arr = []
		count = 0
		chapter_raw.each do |item|
			page_hash = {}
			curr_page_url = item.attributes.first.last.value
			page_hash[:page_url] = curr_page_url
			page_hash[:page_number] = count
			page_hash[:chapter_id] = chapter_id

			manga_chapter_pages_arr << page_hash
			count+=1
		end	
		manga_chapter_pages_arr
	end
	
end

# user_input = MangaScraper.new

# puts manga = user_input.manga_search("one punch man")
# user_input.manga_info(manga)
# manga_chapters = user_input.chapters_list(manga)
# # puts manga_chapters[10]
# puts user_input.chapter_pages(manga_chapters[0][:chapter_url])













