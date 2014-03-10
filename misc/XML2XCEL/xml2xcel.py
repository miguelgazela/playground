#!/usr/bin/env python

import xml.etree.ElementTree as ET
from xlwt import *

def main():
    try:
        tree = ET.parse('strings.xml')
    except IOError:
        print "The strings.xml file was not found."
        return
    except ET.ParseError:
        print "Not well-formed XML file."
        return

    root = tree.getroot()
    workbook = Workbook()
    sheet = workbook.add_sheet('Android Strings')
    sheet.write(0, 0, 'String Name')
    sheet.write(0, 1, 'String Value')

    # write xml content to the excel file
    counter = 1
    for child in root.findall('string'):
        sheet.write(counter, 0, child.get('name'))
        sheet.write(counter, 1, child.text)
        counter += 1

    workbook.save('strings.xls')

if __name__ == "__main__":
    main()