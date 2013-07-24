# coding: utf-8
require 'spec_helper'

describe "Api::V1::Posts" do
  describe "GET /api/v1/posts.json" do
    before do
      10.times { FactoryGirl.create(:post) }
    end

    it 'ステータスコード200が返る' do
      get api_v1_posts_path, format: :json
      expect(response.status).to eq(200)
    end

    it '10個の投稿が返る' do
      get api_v1_posts_path, format: :json
      json = JSON.parse(response.body)
      expect(json.count).to eq(10)
    end

    it '必要な属性がある' do
      get api_v1_posts_path, format: :json
      json = JSON.parse(response.body)
      json.each do |data|
        expect(data.keys).to match_array(['title', 'name', 'body'])
      end
    end

  end
end
