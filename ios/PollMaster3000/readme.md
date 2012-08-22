# Spec

1.) we'll do a quick feedback session (hopefully <1hr).
2.) We'll spend ~1hr to finish the running app.
3.) Lunch
4.) We'll start a new UITableView app.

Let's build a simple polling app.  Inside a UITabBarController, let's have:

a) A first view presenting a form where I can upload a question.  You
can assume each question is of the format strongly agree, agree,
neutral, etc.
b) The second view should present a navigation controller.  The root
controller should be a UITableViewController listing all the uploaded
questions, and if I select one of these, I'd like to push over another
controller that lets me respond to the poll.  Of course, I should only
get to vote once per poll, but allow me to go back and modify my
answers.
c) A third view controller should again list the polls, and when I
select one I'd like it to display the current poll results.



## Also wanted to suggest for the poll app:

1.) First build the uploading of questions.  Test it out!
2.) Next build the display of questions.  Test it out!
3.) Let the user click over and select a question; present a dialog to
save response.  Test it out!
4.) Let the user click over and select a question; display results.
Test it out!

## What I'm Working on here
Here, I'm learning how to use multiple view controllers at once. 

The first is the tab view. There are three tabs (make a poll, answer a poll, and view results).

In the first tab, we polls to parse.
