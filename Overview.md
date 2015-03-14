# Overview #

ResearchMatch is an open-source Web application intended for use by university departments interested in facilitating for their students the process of finding undergraduate research. Written in Ruby on Rails, ResearchMatch is a student-developed application designed with ease of use and flexibility in mind. It is characterized by the following features:
  * CAS authentication and LDAP bindings to receive basic information regarding student data;
  * Smart matching of undergraduate positions with students based on their interests, courses, and experience;
  * Minimal interaction on behalf of professors, who can then focus on their work and delegate research administrivia to their graduate students;
  * In-app application for positions and uploading of documents such as resumes and transcripts.


# Setup #

Deploying ResearchMatch on your own development server is simple. You will need the following backend tools installed:

  * MySQL
  * _Sphinx (this may not be necessary; I believe the ThinkingSphinx plugin already handles this from within the app)_
  * Rails 2.3
  * Ruby 1.8

Specifically, the following packages are recommended for setting up ResearchMatch on a Linux box (e.g. Ubuntu):

  * ruby-dev
  * ruby
  * mysql-server

The first time you run the app, you need to set up the configuration files:
  * _cap init (is this the right command?)_
  * rake ldap:setup

To launch the app, run the following:

```
rake ts:reindex
rake ts:start
ruby script/server
```

To terminate the app, run the following:

```
^C _(to terminate the Ruby server)_
rake ts:stop
```

For a list of rake tasks associated with ThinkingSphinx, click [here](http://freelancing-god.github.com/ts/en/rake_tasks.html).

# Uncommitted Files #
The following files are not committed the repository because they contain sensitive data like passwords, but are necessary for proper configuration of ResearchMatch:
  * config/development.sphinx.conf
  * config/database.yml
  * config/ldap.yml (generated via `rake ldap:setup`)
  * config/smtp\_pw.rb  (which is simply of the following form:)
```
    @@smtp_pw = "THE_PASSWORD_HERE"
```

# Conclusion #

This document will be updated as the project progresses. Please feel free to ask any questions by commenting on this wiki page.

# Contact Information #

Please submit bug reports and feature requests directly on this project's [issue tracker](http://code.google.com/p/research-cs194/issues/). This is the fastest and easiest way for the developers to see and resolve your concerns.


Professor Fox is the department sponsor, technical contact, and 'big daddy' of ResearchMatch. For any such administrative requests or questions, please contact:
> Armando Fox - Adjunct Associate Professor<br>
<blockquote>UC Berkeley Computer Science Division<br>
fox .at. cs .dot. berkeley .dot. edu<br>
465 Soda Hall #1776, Berkeley, CA 94720-1776<br>
+1.510.642.6820  /  <a href='http://www.cs.berkeley.edu/~fox'>http://www.cs.berkeley.edu/~fox</a><br>