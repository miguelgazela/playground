from imdb import IMDB


def main():
    my_api = IMDB()
    for movie in my_api.get_movies_near_you():
        print movie


if __name__ == "__main__":
    main()