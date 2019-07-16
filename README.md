# Mangatopia App

Mangatopia is an app that was made for a fullstack challenge. The challenge was to build fullstack website with 0 javascript. This is a manga reading website where you can live add new manga by making a search on the site. It uses Nokogiri to scrape other manga sites for the mangas bio, chapters and chapter pages. This site was made for educational purposes and should never be used for commercial profit. 

## Initial Setup

You will need Ruby installed and rails. The current build runs Ruby 2.6.1p33 and Rails 5.2.3. Bundle install or sudo bundle install to load gem file. 

### Installing

```
bundle install
```

or 

```
sudo bundle install
```

### Getting Started

To get started with running the server. This application assumes you have Postgres installed locally on your machine. If you don't you can visit  [Postgres](https://postgresapp.com/downloads.html) for the installation documentation. Then start the server and we can create the database. 

Create the database and Migrate Tables

```
rails db:create && rails db:migrate
```

The seed the database or create your own seeds in the seed file. 

```
rails db:seed
```

Run the server

```
rails s
```
# Homepage
![Mangatopia](https://i.ibb.co/8gScLh1/Screen-Shot-2019-07-16-at-4-11-07-PM.png "Mangatopia")

## Manga Show Page
![Mangatopia](https://i.ibb.co/JHXj4hh/Screen-Shot-2019-07-16-at-4-11-58-PM.png "Mangatopia")

## Read Manga Chapter

![Mangatopia](https://i.ibb.co/PF1VxNR/Screen-Shot-2019-07-16-at-4-13-22-PM.png "Mangatopia")

## Search By Genre

![Mangatopia](https://i.ibb.co/GMCjDcc/Screen-Shot-2019-07-16-at-4-13-42-PM.png "Mangatopia")

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Frontend Framework
* [Materialize CSS](https://materializecss.com/) - CSS Framework
* [Nokogiri](https://nokogiri.org/tutorials/installing_nokogiri.html#mac_os_x) - Web Scraping Library

## Versioning

I use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Author

* **Brenden Williams** - [VonStein](https://github.com/VonStein7)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Big Ups to Flatiron School and my Cohort for supporting me through this project.
