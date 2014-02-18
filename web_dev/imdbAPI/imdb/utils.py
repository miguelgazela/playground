import requests
from bs4 import BeautifulSoup

from constants import BASE_URL

def get_soup(page='', payload=None):
    """
    Returns a bs4 objects of the page requested
    """
    if payload is None:
        payload = {}

    content = requests.get("{base_url}/{page}".format(
        base_url=BASE_URL,
        page=page), params=payload)

    return BeautifulSoup(content.text)