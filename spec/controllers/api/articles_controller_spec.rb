require "rails_helper"

describe :articles_controller, type: :request do
  let(:headers) do
    {"Accept" => "application/json"}
  end

  describe "#index" do
    subject (:index) { get api_articles_path, headers: headers }

    it "returns 200 response" do
      index
      expect(response).to be_successful
    end
  end

  describe "#show" do
    subject (:show) { get api_article_path(article.id), headers: headers }

    let!(:article) { Article.create(name: "test" ) }

    it "returns 200 response" do
      show
      expect(response).to be_successful
    end

    context "when article id is invalid" do
      subject (:show) { get api_article_path(bogus_id), headers: headers }

      let(:bogus_id) { 999 }

      it "returns 404 response" do
        expect { show }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
