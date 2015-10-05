require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "populates an array of articles" do
      first_article = FactoryGirl.create(:article, author_name: 'Smith')
      second_article = FactoryGirl.create(:article, author_name: 'Jones')
      get :index
      expect(assigns(:articles)).to match_array([first_article, second_article])
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      article = FactoryGirl.create(:article)
      get :show, id: article
      expect(response).to render_template(:show)
    end

    it "assigns the requested article to @article" do
      article = FactoryGirl.create(:article)
      get :show, id: article
      expect(assigns(:article)).to eq article
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      article = FactoryGirl.create(:article)
      get :new, id: article
      expect(response).to render_template(:new)
    end

    it "assigns a new Article to @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      article = FactoryGirl.create(:article)
      get :edit, id: article
      expect(response).to render_template(:edit)
    end

    it "assigns the requested article to @article" do
      article = FactoryGirl.create(:article)
      get :edit, id: article
      expect(assigns(:article)).to eq article
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new article in the database" do
        expect {
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article, :count).by(1)
      end

      it "redirects to article#show" do
        post :create, article: FactoryGirl.attributes_for(:article)
        expect(response).to redirect_to article_path(assigns[:article])
      end
    end

    context "with invalid attributes" do
      it "does not save the new article in the database" do
        expect {
          post :create, article: FactoryGirl.attributes_for(:invalid_article)
        }.to_not change(Article, :count)
      end

      it "re-renders the :new template" do
        post :create, article: FactoryGirl.attributes_for(:invalid_article)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @article = FactoryGirl.create(:article,
                                    title: 'Example',
                                    content: 'Rails')
    end

    context "valid attributes" do
      it "locates the requested @article" do
        patch :update, id: @article,
          article: FactoryGirl.attributes_for(:article)
        expect(assigns(:article)).to eq(@article)
      end

      it "changes @article's attributes" do
        patch :update, id: @article,
          article: FactoryGirl.attributes_for(:article,
                                              title: 'Another title',
                                              content: 'Another content')
        @article.reload
        expect(@article.title).to eq('Another title')
        expect(@article.content).to eq('Another content')
      end

      it "redirects to the updated article" do
        patch :update, id: @article,
          article: FactoryGirl.attributes_for(:article)
        expect(response).to redirect_to @article
      end
    end

    context "with invalid attributes" do
      it "does not change the @article's attributes" do
        patch :update, id: @article,
          article: FactoryGirl.attributes_for(:article,
                                              title: 'Update', content: nil)
        @article.reload
        expect(@article.title).to_not eq('Update')
        expect(@article.content).to eq('Rails')
      end

      it "re-renders the edit template" do
        patch :update, id: @article,
          article: FactoryGirl.attributes_for(:invalid_article)
        expect(response).to render_template 'edit'
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @article = FactoryGirl.create(:article)
    end

    it "deletes the article" do
      expect {
        delete :destroy, id: @article
      }.to change(Article, :count).by(-1)
    end

    it "redirects to article#index" do
      delete :destroy, id: @article
      expect(response).to redirect_to articles_path
    end
  end
end
