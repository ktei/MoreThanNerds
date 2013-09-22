class Message < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :author,
    :presence => true,
    :length =>  { :maximum => 50 }

  validates :email, 
    :presence => true,
    :format => { :with => email_regex },
    :length => { :maximum => 200 }
  
  validates :content, 
    :presence => true,
    :length =>  { :maximum => 2500 }
    
  
  default_scope { order('messages.created_at desc') }
  
  def as_json(options = {})
    options[:methods] = [:gravatar_url]
    options[:except] = [:id]
    super(options)
  end
  
end
