from utils import get_soup

class IMDB(object):
    """
    The class that gives access to the imdb data
    """

    def get_movies_near_you(self):
        """
        Yields a list of movies and the theaters near you where they're
        playing, as well as the showtimes
        """

        soup = get_soup('/showtimes/')
        list_movies = soup.find_all(class_='list_item')

        for item in list_movies:
            movie = {}

            page = item.find('a')['href']
            soup = get_soup(page)
            movie_info = soup.select('.article > .article .overview-top')[0]
            
            movie['title'] = movie_info.h4.a.text
            movie['url'] = movie_info.h4.a['href']
            movie['runtime'] = movie_info.p.time.text
            movie['ratingValue'] = movie_info.select(
                '.rating_txt meta[itemprop="ratingValue"]')[0]['content']

            print movie


            # fetch page of the movie
            # build the movie
            # yield result



def main():
    my_api = IMDB()
    my_api.get_movies_near_you()


if __name__ == "__main__":
    main()