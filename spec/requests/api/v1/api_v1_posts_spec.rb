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

  describe "POST /api/v1/posts" do
    let(:params) {
      {post: post_param, format: :json}
    }

    context "正しいパラメータが送られたとき" do
      let(:post_param) { FactoryGirl.attributes_for(:post) }

      it "201 が返る" do
        post api_v1_posts_path, params
        expect(response.status).to eq(201)
      end

      it "1 つ投稿が増える" do
        expect { post api_v1_posts_path, params }.to change { Post.count }.by(1)
      end
    end

    context "不正なパラメータが送られたとき" do
      let(:post_param) { FactoryGirl.attributes_for(:post, title: 'a') }

      it "422 が返る" do
        post api_v1_posts_path, params
        expect(response.status).to eq(422)
      end

      it "投稿は増えない" do
        expect { post api_v1_posts_path, params }.not_to change { Post.count }
      end

      it "エラーメッセージがbodyに含まれる" do
        post api_v1_posts_path, params
        expect(response.body).not_to be_empty
      end
    end
  end

  describe "PATCH /api/v1/posts/:id" do
    let(:params) {
      {post: post_param, format: :json}
    }
    let(:post) { FactoryGirl.create(:post) }

    context "正しいパラメータが送られたとき" do
      let(:post_param) { FactoryGirl.attributes_for(:post) }

      it "201 が返る" do
        patch api_v1_post_path(post), params
        expect(response.status).to eq(201)
      end

      it "投稿が更新される" do
        patch api_v1_post_path(post), params
        expect(Post.find(post.id).title).to eq(post_param[:title])
      end
    end

    context "不正なパラメータが送られたとき" do
      let(:post_param) { FactoryGirl.attributes_for(:post, title: 'a') }

      it "422 が返る" do
        patch api_v1_post_path(post), params
        expect(response.status).to eq(422)
      end

      it "投稿が更新されない" do
        patch api_v1_post_path(post), params
        expect(Post.find(post.id).title).to eq(post.title)
      end

      it "エラーメッセージがbodyに含まれる" do
        patch api_v1_post_path(post), params
        expect(response.body).not_to be_empty
      end
    end
  end

  describe "DELETE /api/v1/posts/:id" do
    let!(:post) { FactoryGirl.create(:post) }

    it "200 が返る" do
      delete api_v1_post_path(post)
      expect(response.status).to eq(200)
    end

    it "1 つ投稿が減る" do
      expect { delete api_v1_post_path(post) }.to change { Post.count }.by(-1)
    end
  end
end
