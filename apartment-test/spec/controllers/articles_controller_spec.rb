require 'spec_helper'

describe ArticlesController do

  describe 'GET /articles' do
    it "articles that should be cleaned up before the assigns test runs" do
      5.times { create :article }
    end

    it "test that definitely shouldn't break" do
      article = create :article
      get :index
      expect(assigns(:articles)).to eq([article])
    end
  end
end
