import requests
from bs4 import BeautifulSoup

from constants import BASE_URL

def get_soup(page=''):
    """
    Returns a bs4 objects of the page requested
    """
    content = requests.get("{base_url}/{page}".format(
        base_url=BASE_URL,
        page=page)).text
    return BeautifulSoup(content)