#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import webapp2
import cgi
import string

form="""
<form method="POST">
    <h1>Place some text here to Rot13 it!</h1>
    <br>
    <textarea name="text" rows="10">%(text)s</textarea>
    <br>
    <input type="submit">
</form>
"""

def escape_html(s):
    return cgi.escape(s, quote=True)

def rot13(s):
    chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
    trans = chars[26:]+chars[:26]
    rot_char = lambda c: trans[chars.find(c)] if chars.find(c) > -1 else c
    return ''.join(rot_char(c) for c in s)


def process_text(text):
    text = rot13(text)
    return escape_html("".join(text))

class MainPage(webapp2.RequestHandler):

    def get(self):
        # the following line is not necessary, it's default in gae
        # self.response.headers['Content-type'] = 'text/html'
        self.response.write("MainPage")


class Rot13(webapp2.RequestHandler):

    def get(self):
        self.response.write(form)

    def post(self):
        user_text = self.request.get('text')
        self.write_form(process_text(user_text))

    def write_form(self, text=""):
        self.response.write(form % {'text': text})

application = webapp2.WSGIApplication([
    ('/', MainPage),
    ('/rot13', Rot13),
    ], debug=True)