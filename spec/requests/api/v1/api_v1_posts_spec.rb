require 'spec_helper'

describe "Api::V1::Posts" do
  describe "GET /api/v1/posts" do
    context '10 個の投稿があるとき' do
      subject(:json) { JSON.parse(response.body) }

      before do
        10.times { FactoryGirl.create(:post) }
        get api_v1_posts_path, format: :json
      end

      it "レスポンスコードは 200" do
        expect(response.status).to eq(200)
      end

      it "10 個の投稿が返る" do
        expect(json).to have(10).posts
      end

      it "各要素は title, name, body 属性を持つ" do
        json.each do |data|
          expect(data.keys).to match_array(['title', 'name', 'body'])
        end
      end
    end
  end
end
