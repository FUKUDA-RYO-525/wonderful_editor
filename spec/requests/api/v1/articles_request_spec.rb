# require "rails_helper"

# RSpec.describe "Api::V1::Articles", type: :request do
#   # 中略

#   describe "POST /articles" do
#     subject { post(api_v1_articles_path, params: params, headers: headers) }

#     let(:params) { { article: attributes_for(:article) } }
#     let(:current_user) { create(:user) }

#     let(:headers) { current_user.create_new_auth_token }

#     it "記事のレコードが作成できる" do
#       expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
#       res = JSON.parse(response.body)
#       expect(res["title"]).to eq params[:article][:title]
#       expect(res["body"]).to eq params[:article][:body]
#       expect(response).to have_http_status(:ok)
#     end
#   end

#   describe "PATCH /api/v1/articles/:id" do
#     subject { patch(api_v1_article_path(article.id), params: params, headers: headers) }

#     let(:params) { { article: attributes_for(:article) } }
#     let(:current_user) { create(:user) }
#     let(:headers) { current_user.create_new_auth_token }

#     context "自分が所持している記事のレコードを更新しようとするとき" do
#       let(:article) { create(:article, user: current_user) }

#       it "記事を更新できる" do
#         expect { subject }.to change { article.reload.title }.from(article.title).to(params[:article][:title]) &
#                               change { article.reload.body }.from(article.body).to(params[:article][:body])
#         expect(response).to have_http_status(:ok)
#       end
#     end

#     context "自分が所持していない記事のレコードを更新しようとするとき" do
#       let(:other_user) { create(:user) }
#       let!(:article) { create(:article, user: other_user) }

#       it "更新できない" do
#         expect { subject }.to raise_error(ActiveRecord::RecordNotFound) &
#                               change { Article.count }.by(0)
#       end
#     end
#   end

#   describe "DELETE /articles/:id" do
#     subject { delete(api_v1_article_path(article_id), headers: headers) }

#     # devise_token_auth の導入が完了後に削除
#     let(:current_user) { create(:user) }
#     let(:article_id) { article.id }
#     let(:headers) { current_user.create_new_auth_token }

#     context "自分の記事を削除しようとするとき" do
#       let!(:article) { create(:article, user: current_user) }

#       it "記事を削除できる" do
#         expect { subject }.to change { Article.count }.by(-1)
#         expect(response).to have_http_status(:no_content)
#       end
#     end

#     context "他人が所持している記事のレコードを削除しようとするとき" do
#       let(:other_user) { create(:user) }
#       let!(:article) { create(:article, user: other_user) }

#       it "記事を削除できない" do
#         # expect { subject }.to raise_error(ActiveRecord::RecordNotFound) &
#         #                       change { Article.count }.by(0)
#       end
#     end
#   end
# end
