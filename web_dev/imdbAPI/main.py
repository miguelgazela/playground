from imdb import IMDB


def main():
    api = IMDB()

    # for movie in my_api.get_movies_near_you():
    #     print movie
    query = raw_input("Search: ")
    print len(api.search_movie(query))


if __name__ == "__main__":
    main()