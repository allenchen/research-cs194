class FacultyMailer < ActionMailer::Base
   def faculty_confirmer(email, name, job)#job_id, job_title, job_description, activation_code)
     recipients email
     from       "system"
     subject    "ResearchMatch Job Posting Confirmation"
     body       :email => email, :name => name, :job => job #:activation_url => job.activation_url :job_title => job_title, :job_description => job_description, :job_id => job_id
   end
end
