#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import webapp2
import os
import jinja2
from google.appengine.ext import db


template_dir = os.path.join(os.path.dirname(__file__), 'templates')
jinja_env = jinja2.Environment(loader = jinja2.FileSystemLoader(template_dir), autoescape=True)


class Post(db.Model):
    subject = db.StringProperty(required=True)
    content = db.TextProperty(required=True)
    created = db.DateTimeProperty(auto_now_add=True)


class Handler(webapp2.RequestHandler):
    def write(self, *a, **kw):
        self.response.out.write(*a, **kw)

    def render_str(self, template, **params):
        t = jinja_env.get_template(template)
        return t.render(params)

    def render(self, template, **kw):
        self.write(self.render_str(template, **kw))


class MainPage(Handler):

    def get(self):
        # the following line is not necessary, it's default in gae
        # self.response.headers['Content-type'] = 'text/html'
        self.write("MainPage")


class Blog(Handler):

    def get(self):
        posts = Post.all().order('-created')
        # posts = db.GqlQuery('SELECT * FROM Post ORDER BY created DESC')
        self.render('blog.html', posts=posts)


class PostPermalink(Handler):

    def get(self, post_id):
        post = Post.get_by_id(int(post_id))
        self.render('blog.html', posts=[post])


class NewPost(Handler):

    def get(self):
        self.render('newpost.html')

    def post(self):
        subject = self.request.get('subject')
        content = self.request.get('content')

        if subject and content:
            post = Post(subject=subject, content=content)
            post.put()
            self.redirect('/blog/{}'.format(post.key().id()))
        else:
            error = "We need both a subject and a blog!"
            self.render('newpost.html', subject=subject, content=content, error=error)


application = webapp2.WSGIApplication([
    ('/', MainPage),
    ('/blog', Blog),
    ('/blog/(\d+)', PostPermalink),
    ('/blog/newpost', NewPost),
    ], debug=True)