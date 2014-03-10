#!/usr/bin/env python

import xml.etree.ElementTree as ET
from xlwt import *
from sys import argv


def get_xml_tree(filename):
    """
    Tries to parse a xml file and return a tree built from
    its content.
    """

    try:
        return ET.parse(filename)
    except IOError:
        print "The file {} was not found.".format(filename)
        return None
    except ET.ParseError:
        print "Not well-formed XML file."
        return None


def save_strings_2_excel(strings, filename):
    """
    Saves a list of strings to an excel file
    """

    workbook = Workbook()
    sheet = workbook.add_sheet('Android Strings')
    sheet.write(0, 0, 'String Name')
    sheet.write(0, 1, 'String Value')

    counter = 1
    for string in strings:
        sheet.write(counter, 0, string.get('name'))
        sheet.write(counter, 1, string.text)
        counter += 1

    workbook.save(filename)


def main():

    if len(argv) == 3:
        script, source, dest = argv
    else:
        print "Usage: xml2xcel.py SOURCE DEST"
        return

    tree = ET.parse(source)
    if not tree:
        return

    root = tree.getroot()
    save_strings_2_excel(root.findall('string'), dest)


if __name__ == "__main__":
    main()