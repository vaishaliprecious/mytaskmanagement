require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
      end
    it "when user is sign in" do
        get root_path	
        expect(response).to  have_http_status(302)
      end
    end

    it "when user is not signin" do
      get tasks_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /tasks/:id" do
    context "when user is authenticated" do 
      before(:each) do 
        category=FactoryBot.create(:category)
      end
     it "show the task" do
      get tasks_path
      expect(response).to  have_http_status(302)
     end
    end
  end
describe "POST tasks_path" do
  context "when user is authenticated" do
    before(:each) do 
      category=FactoryBot.create(:category)
      user = FactoryBot.create(:user)
      task= FactoryBot.create(:task,user:user,category: category)
      sign_in user
    end
     it "when task is created" do
      post tasks_path
      expect(response).to  have_http_status(302)  
      end
     it "when task is not created" do
      get new_task_path
      expect(response).to  have_http_status(302)
     end
    end
  end
  
    describe "GET /tasks/:id/edit" do
      context "when user is authenticated" do 
        before(:each) do 
          category=FactoryBot.create(:category)
          user = FactoryBot.create(:user)
          @task= FactoryBot.create(:task,user:user,category: category)
        end
       it "when task is edit" do
        get edit_task_path(@task)
        expect(response).to  have_http_status(302)
       end
      end
    end
    describe "PUT /tasks/:id" do
      context "when user is authenticated" do 
        before(:each) do 
          category=FactoryBot.create(:category)
          user = FactoryBot.create(:user)
          byebug
          sign_in user
          @task= FactoryBot.create(:task,user:user,category: category)
        end
        it "when task is updated" do
          put task_path(@task)
          expect(response).to  have_http_status(302)
        end
        it "when task is not updated" do
          get edit_task_path(@task)
          # byebug
          expect(response).to  have_http_status(200)
        end
      end
    end   
    describe "DELETE /tasks/:id" do
      context "when user is authenticated" do 
        before(:each) do 
          user = FactoryBot.create(:user)
        end
       it "when task is updated" do
        get tasks_path
        expect(response).to  have_http_status(302)
       end
      end
    end 
end