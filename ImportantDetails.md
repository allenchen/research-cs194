# Introduction #

job\_inactives\_controller.rb


# Details #

job\_inactives\_controller.rb - a way to kind of "reverse" grab all instance variables and their values of an object?
e.g. let x be some hash that is (:a => "b", :c => "d")
Given y = SomeObject.new(x), I want to be able to retrieve x.

# Nice Features to Have in the Future #
  * Color-code the tags based on what type they are (name of category, name of course, name of proglang, etc.)
  * Add a "my posted jobs" type thing on the dashboard
  * Add links to delete jobs you've posted.
  * Each job's show page should list all the users currently watching.
  * **All things that mention user names should be linked; they should link to that user's show page.**
  * Commenting system on jobs and/or reviews.
  * Dashboard
    * For faculty, replace Your Watched Projects with Your Projects (i.e. ones you've posted)
  * Posting jobs:
    * If the user is a student, then student picks a faculty sponsor; sponsor, rather than student, receives email containing activation code of job (student just receives pending confirmation email). When job is approved, both parties are emailed (including the link to the new job)
    * If the user is a faculty member, then when posting a job, his/her name is automatically selected from the "faculty sponsor" dropdown. If he leaves this as is, activation email is sent to him/herself. Otherwise -- i.e., if one faculty member posts a job on behalf of another member, the member who's actually sponsoring the event (whoever is selected in the dropdown list) gets the activation email.
  * Expiration date of jobs should actually work -- i.e., once the date has passed, make them inactive.
  * Make default expiration dates later than 'now', if they aren't like this already.

  * Faculty should get SmartMatch results of STUDENTS rather than of JOBS.
  * Jobs show pages should list the names of users watching; also, in the dashboard, faculty should see e.g. "3 people watching" next to each of their projects in the "Your Projects" section.

# Pending Design Decisions #
  * On a faculty member's dashboard, should "Your Projects" contain jobs POSTED BY this faculty, or jobs whose faculty sponsor is this faculty?

# Known Bugs #
> (in the future, please use the actual issues tab for this)

- <s>Editing a job:  Enter a new job with a title filled and description blank. Then hit submit. validation error occurs, but this time the faculty names dropdown is totally empty.</s> <b><font color='red'>Fixed in <a href='https://code.google.com/p/research-cs194/source/detail?r=93'>r93</a></font></b>

- Filtering / searching doesn't work that well. For example, a job with title "hihi" won't be found by typing "hi" into the box.  Ignore quotes of course.

- When editing a job, any attempts to change the faculty member associated with the job fail. I.e. if you click Update, the faculty doesn't change.  (Title, desc, other fields update just fine, but the faculties don't update).  This probably has something to do with sponsorships.. not quite sure how though.

- When viewing faculty dropdown lists, faculties with names containing letters with accent marks like "Bjorn" or "Sequin" have a "box with a question mark" symbol instead of the proper letter.

# Solr Stuff #
Before doing `ruby script/server` for development, we must start up the Solr server for full text search. To do this:

...on Windows, use
`rake solr:start_win`.

...on Unix, use
`rake solr:start`.