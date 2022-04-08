require 'rails_helper'

RSpec.describe "Record", type: :request do
  context "create record" do
    it "should create a record" do
      post '/records', params: {amount: 100, category: 'outgoings', notes: '测试'}
      expect(response.status).to eq 200 
    end
  end
end

