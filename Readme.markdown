# Purpose of this Application

I created this Rails application for my web development bootcamp training at CodeCore (www.codecore.ca).

The bootcamp trains its students to be proficient in Ruby, Rails, HTML/CSS, Javascript, and Javascript libraries in 8 weeks.

After each major lesson, our instructor adds more requirements to the project:

# Getting Started

We will get started by setting up the Blog project which we will work on for the rest of this bootcamp.

Here is what you need to do:

* Setup empty Rails project (make sure it's version 4.2 or more)
* Make sure that the project uses postgres database
* Create controller "home" that handles home and static pages
* Create a page "About" which has information about the tool (anything for now). 
* Add your photo and information in the about page (link to external photo of you for now)
* Create a navigation bar that applies to all pages. The navigation bar must include links to "home" and "about" pages
* Put all of your code on GitHub (or BitBucket)
* Submit the Github link.

# Build Your Models

Build four of your main models: post, comment, category and contact (don't worry about associations yet, will add those later).

Here are a summary of suggested fields and validations (feel free to add to those)

* Post: title(required & unique), body
* Comment: body (required & unique per blog post)
* Category: title(required)
* Contact: email, name, subject and message

# Posts

Build CRUD for the posts in your blog with:

* Ability to list all the posts in the app
* Ability to view a page with a form to create a new post
* Ability to click "submit" on the form and create the post
* It shouldn't allow creating posts without a title
* On the listing page there should be a link to visit the post display page
* That page should have "edit" and "delete" links
* Clicking the edit link should go to a page similar to the one for creating new post, except that it should say "editing post" and should be pre-populated with post info
* Clicking "delete" should prompt the user "Are you use you want to delete this post" and if the user clicks "yes" it should delete the post from database and takes user back to listing page.

# Comments

Implement full CRUD operations for Comment resource in the Blog. Very similar to the Post resource.

Each post needs comments so build a way to add comments to posts.

Each comment must have "body". 

Make sure that on the post show page you list all the comments ordered by creation date. Most recent at the top.

# User Authentication

Add standard user authentication with Devise for your Blog. Make sure your user has first name and last name

Associate records with the user model as per your ERD.

# Redirection

Find out how to redirect user to new post page after the signed up for the first time.