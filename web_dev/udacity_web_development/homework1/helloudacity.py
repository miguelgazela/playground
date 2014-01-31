#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import webapp2
import cgi
import string
import re

form="""
<form method="POST">
    <h1>Place some text here to Rot13 it!</h1>
    <br>
    <textarea name="text" rows="10">%(text)s</textarea>
    <br>
    <input type="submit">
</form>
"""

signup_form="""
<form method="POST">
    <h1>Sign Up</h1>
    <label>Username</label>
    <input type="text" placeholder="Username" name="username" value="%(username)s">
    <span style="color: red;">%(user_error)s</span>
    <br>
    <label>Password</label>
    <input type="password" placeholder="Password" name="password">
    <span style="color: red;">%(pass_error)s</span>
    <br>
    <label>Verify Password</label>
    <input type="password" placeholder="Confirm Password" name="verify">
    <span style="color: red;">%(verify_error)s</span>
    <br>
    <label>Email (optional)</label>
    <input type="email" placeholder="Email" name="email" value="%(email)s">
    <span style="color: red;">%(email_error)s</span>
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


USER_RE = re.compile(r'^[a-zA-Z0-9_-]{3,20}$')
PASS_RE = re.compile(r'^.{3,20}$')
EMAIL_RE = re.compile(r'^[\S]+@[\S]+\.[\S]+$')


def valid_username(username):
    return USER_RE.match(username)

def valid_password(password):
    return PASS_RE.match(password)

def valid_email(email):
    return EMAIL_RE.match(email)


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


class SignUpPage(webapp2.RequestHandler):

    def get(self):
        self.write_form()

    def post(self):
        valid_user = valid_username(self.request.get('username'))
        valid_pass = valid_password(self.request.get('password'))
        verified_pass = self.request.get('password') == self.request.get('verify')

        if self.request.get('email'):
            valid_mail = valid_email(self.request.get('email'))
        else:
            valid_mail = True

        if valid_user and valid_pass and verified_pass and valid_mail:
            self.redirect('/welcome?username={0}'.format(self.request.get('username')))

        user_error = ""
        pass_error = ""
        email_error = ""
        verify_error = ""

        if not valid_user:
            user_error = "That's not a valid username."

        if not valid_pass:
            pass_error = "That's not a valid password."
        elif not verified_pass:
            verify_error = "Your passwords didn't match."

        if not valid_mail:
            email_error = "That's not a valid email."
            

        self.write_form(
            username=self.request.get('username'), 
            email=self.request.get('email'),
            user_error=user_error,
            pass_error=pass_error,
            email_error=email_error,
            verify_error=verify_error)


    def write_form(self, username="", email="", user_error="",
            pass_error="", verify_error="", email_error=""):
        self.response.write(signup_form % {
            'username': username, 
            'email': email,
            'user_error': user_error,
            'pass_error': pass_error,
            'verify_error': verify_error,
            'email_error': email_error})


class WelcomePage(webapp2.RequestHandler):

    def get(self):
        self.response.write("<h1>Welcome, {user}!</h1>".format(user=self.request.get('username')))


application = webapp2.WSGIApplication([
    ('/', MainPage),
    ('/rot13', Rot13),
    ('/signup', SignUpPage),
    ('/welcome', WelcomePage),
    ], debug=True)