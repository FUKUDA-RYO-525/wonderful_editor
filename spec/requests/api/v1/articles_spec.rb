require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles/:id" do
    subject { get(api_v1_article_path(article_id)) }

    context "指定したidの記事が存在する場合" do
      let(:article) { create(:article) }
      let(:article_id) { article.id }

      it "任意の記事の値が取得できる" do
        subject
        #  binding.pry
        # res =
        JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        # expect(res["id"]).to eq article.id
        # expect(res["title"]).to eq article.title
        # expect(res["body"]).to eq article.body
        # expect(res["user"]["id"]).to eq article.user.id
        # expect(res["user"].keys).to eq ["id", "name", "email"]
        # expect(res["updated_at"]).to be_present
      end
    end

    context "指定したidの記事が存在しないとき" do
      let(:article_id) { 100000 }

      it "記事が出てこない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end