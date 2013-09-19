require 'spec_helper'

describe MessagesController do
  
  describe "GET 'index'" do
    before(:each) do
      @msg1 = FactoryGirl.create(:message, :created_at => 1.day.ago)
      @msg2 = FactoryGirl.create(:message, :created_at => 1.year.ago)
      @msg3 = FactoryGirl.create(:message, :created_at => 1.hour.ago)
    end
    
    it 'should return messages in lastest-first order' do
      get :index, :format => :json
      response.body.should == [@msg3, @msg1, @msg2].to_json
    end
    
    it 'should paginate properly' do
      get :index, :per_page => 2, :format => :json
      response.body.should == [@msg3, @msg1].to_json
      get :index, :page => 2, :per_page => 2, :format => :json
      response.body.should == [@msg2].to_json
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      @input = { author: Faker::Name.name, email: Faker::Internet.email, content: Faker::Lorem.sentence(10) }
    end
    
    it 'should create a message with valid input' do
      lambda do
        post :create, :message => @input, :format => :json
      end.should change(Message, :count).by(1)
    end
    
    it 'should reject empty content' do
      lambda do
        post :create, :message => @input.merge({content: ''}), :format => :json
      end.should_not change(Message, :count)
    end
    
    it 'should reject content that is too long' do
      lambda do
        post :create, :message => @input.merge({content: 'a' * 2501}), :format => :json
      end.should_not change(Message, :count)
    end
    
    it 'should reject empty author' do
      lambda do
        post :create, :message => @input.merge({author: ''}), :format => :json
      end.should_not change(Message, :count)
    end
    
    it 'should reject empty email' do
      lambda do
        post :create, :message => @input.merge({email: ''}), :format => :json
      end.should_not change(Message, :count)
    end
  end
 
end
