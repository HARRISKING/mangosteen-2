require 'rails_helper'

RSpec.describe "Record", type: :request do
  context "create record" do
    it "should create a record" do
      post '/records', params: {amount: 100, category: 'outgoing', notes: '测试'}
      expect(response.status).to eq 200 
    end

    it "should not create a record" do
      post '/records', params: { category: 'outgoing', notes: '测试' }
      expect(response.status).to eq 422  
      body = JSON.parse(response.body)
      expect(body['errors']['amount'][0]).to eq "can't be blank"  
    end
  end

  context "destroy" do
    it "should destroy the record" do 
      record = Record.create! amount: 102, category: 'income'
      delete "/records/#{record.id}"
      expect(response.status).to eq 200
    end
  end

  context "show" do
    it "should find the record" do
      record = Record.create! amount: 103, category: 'outgoing'
      get "/records/#{record.id}"
      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body['resource']['amount']).to be 103
    end
    # it 'should not find the record because not found' do
    #   get "/records/999999"
    #   expect(resource.status).to eq 404
    # end
  end

  context "index" do
    it "should find the records" do
      11.times do |i|
        Record.create! amount: 100, category: 'income'
      end
      get "/records"
      expect(response.status).to eq 200
      budy = JSON.parse(response.body)
      expect(body['resources'].length).to eq 9
    end
  end
end

