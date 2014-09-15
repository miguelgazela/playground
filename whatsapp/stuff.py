#!/usr/bin/env python

from datetime import datetime, date
import re
import string
from collections import OrderedDict
from xlwt import Workbook

def get_messages():
	messages = []

	with open("chat.txt") as fin:
		for line in fin:
			cleaned_line = line.strip()
			match = re.search(r'\d{2}/\d{2}/\d{2}.{12}Lu', cleaned_line)

			if match:
				messages.append(cleaned_line)
	
	return messages


def process_daily_messages(messages):
	history = OrderedDict()

	for msg in messages:
		found = re.search(r'^(\d\d/\d\d/\d\d)', msg)
		date = found.group(0)

		if date:
			if history.has_key(date):
				day = history.get(date)
				day.append(msg)

				history[date] = day
			else:
				history[date] = [msg]

	return history


def save_day(date, messages):



def main():
	print "Starting Program"
	workbook = Workbook()

	messages = get_messages()
	history = process_daily_messages(messages)

	
	
	# save to excel file
	workbook = Workbook()
	sheet = workbook.add_sheet('WhatsApp Messages')
	sheet.write(0, 0, 'Date')
	sheet.write(1, 0, '# Messages')
	sheet.write(2, 0, '# Words')
	sheet.write(3, 0, 'Avg # Words per Message')

	counter = 1
	word_dict = {}

	for key in history.keys():
		number_msgs = len(history[key])
		total_words = 0

		for line in history[key]:
			words = line.split()

			for word in words[3:]:
				word_dict[word] = word_dict.get(word, 0) + 1

			total_words += (len(words) - 3) # 3 to account for the date, time and name
			# cleaned = line.translate(string.maketrans("",""), string.punctuation) # remove punctuation

		sheet.write(0, counter, key)
		sheet.write(1, counter, number_msgs)
		sheet.write(2, counter, total_words)
		sheet.write(3, counter, total_words / float(number_msgs))

		counter += 1

		print key, number_msgs
		print "Total Words: {}".format(total_words)
		print "Average Number of Words per Message: {}".format(total_words / float(number_msgs))

	workbook.save('WhatsApp.xls')

	with open("word_hist.txt", 'w') as fout:
		for key, value in sorted(word_dict.iteritems(), key=lambda (k, v): v, reverse=True):
			fout.write("{} {}\n".format(key, value))

if __name__ == "__main__":
	main()