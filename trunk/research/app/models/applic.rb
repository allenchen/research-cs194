class Applic < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  has_one  :resume,      :class_name => 'Document', :conditions => {:document_type => Document::Types::Resume}
  has_one  :transcript,  :class_name => 'Document', :conditions => {:document_type => Document::Types::Transcript}
  
  validates_presence_of   :message
  validates_length_of     :message, :minimum => 1, :too_short => "Please enter a message to the faculty sponsor of this job." 
end