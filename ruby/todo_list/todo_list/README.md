# Spec
1. Create a RESTful List resource with associated views.
2. Create a RESTful Task resource with associated views. Each Task
should belong to a single list.
3. Tasks have a binary state: either uncompleted or completed.
4. Build an API for the Lists and Tasks
5. Build a command line client that consumes the API



This project was good for figuring out lists controller

url: protocol://base/route?parameters
  params[:list][:title]

We built out the Rails app normally, then went back into the controllers to make them respond to a REST Client.

Then, under the todo_cli folder, we built out the command line interface. Handling multiple ARGV variables was the trickiest part (without making 100 case statements). I like the solution I came up with.