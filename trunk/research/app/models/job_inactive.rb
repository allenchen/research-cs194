class JobInactive < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :pictures
  
  acts_as_solr :fields => [:title, :desc]
end
