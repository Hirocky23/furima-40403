require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:user) { create(:user) } # 適切なユーザーを作成します
  let(:headers) { { 'Authorization' => "Bearer #{user.auth_token}" } } # 認証ヘッダーを設定します

  before do
    # ユーザーをサインインさせます (Deviseの場合)
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get purchases_path, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post purchases_path, params: { purchase: { /* 購入に必要なパラメータ */ } }, headers: headers
      expect(response).to have_http_status(:success)
    end
  end
end
