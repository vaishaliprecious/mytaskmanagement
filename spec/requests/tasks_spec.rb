require 'rails_helper'

RSpec.describe "Tasks", type: :request do
   describe "GET /tasks" do
    @task = Task.create(title:"test 1", description:"11111111111111",user: user,category: category)}
      get tasks_path
  #    expect(response).to have_http_status(200)
  #   end
  # end
end
