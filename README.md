# Putting it All Together: Client-Server Communication

## Learning Goals

- Understand how to communicate between client and server using fetch, and how
  the server will process the request based on the URL, HTTP verb, and request
  body
- Debug common problems that occur as part of the request-response cycle

## Introduction

Just like the last lesson, we've got code for a React frontend and Rails API
backend set up. This time though, it's up to you to use your debugging skills to
find and fix the errors!

To get the backend set up, run:

```console
$ bundle install
$ rails db:migrate db:seed
$ rails s
```

Then, in a new terminal, run the frontend:

```console
$ npm install --prefix client
$ npm start --prefix client
```

Confirm both applications are up and running by visiting
[`localhost:4000`](http://localhost:4000) and viewing the list of toys in your
React application.

## Deliverables

In this application, we have the following features:

- Display a list of all the toys
- Add a new toy when the toy form is submitted
- Update the number of likes for a toy
- Donate a toy to Goodwill (and delete it from our database)

The code is in place for all these features on our frontend, but there are some
problems with our API! We're able to display all the toys, but the other three
features are broken.

Use your debugging tools to find and fix these issues.

There are no tests for this lesson, so you'll need to do your debugging in the
browser and using the Rails server logs and `byebug`.

**Note**: You shouldn't need to modify any of the React code to get the
application working. You should only need to change the code for the Rails API.

As you work on debugging these issues, use the space in this README file to take
notes about your debugging process. Being a strong debugger is all about
developing a process, and it's helpful to document your steps as part of
developing your own process.

## Your Notes Here

- Add a new toy when the toy form is submitted

  - How I debugged:
  Debugging Process:

Checked the error message: Received a NameError indicating an uninitialized constant in the create action of the ToysController.

Inspected the code: Reviewed the ToysController class to understand the issue and identified that the error occurred due to calling Toys.create instead of Toy.create in the create action.

Identified the fix: Noted that the correct method to create a new record is Toy.create, so the code needs to be updated accordingly.

Made the necessary change: Modified the line toy = Toys.create(toy_params) to toy = Toy.create(toy_params) in the create action of the ToysController.

Saved the changes and restarted the application: Implemented the fix and ensured that the server was restarted to reflect the changes.

Tested the fix: Tested the create action by submitting a toy form and verified that the toy was successfully created without any errors.

Documented the solution: Updated the code in the README file, documenting the debugging process and the fix implemented.

- Update the number of likes for a toy

  - How I debugged:

  Identifying the Issue: Received a NoMethodError with the message "undefined method +' for nil:NilClass)" in the updateaction of theToysController. This error occurred when attempting to increment the likes` attribute of a toy.

Inspecting the Code: Reviewed the update action in the ToysController and identified the line causing the error, where the likes attribute of the toy was being incremented.

Understanding the Error: Noted that the error occurred because some toys had a nil value for the likes attribute, and arithmetic operations cannot be performed on nil.

Handling the nil Case: Decided to handle the nil case separately by adding a conditional check to set a default value for likes when it is nil.

Modifying the Code: Updated the update action to include the conditional check. If likes is nil, it is set to 1; otherwise, it is incremented by 1.

Testing the Fix: Ran the application and tested the update action with various toys, both with and without existing likes, to ensure that the NoMethodError no longer occurs and the increment functionality works as expected.

- Donate a toy to Goodwill (and delete it from our database)

  - How I debugged:
Identifying the Issue: Received a Completed 204 No Content response after executing the destroy action in the ToysController. No specific error message was provided.

Reviewing the Code: Inspected the destroy action in the ToysController to understand the implementation.

Code Analysis: Verified that the code in the destroy action seems correct. It finds the toy by id, destroys it, and returns a 204 No Content response using head :no_content.

Error Message Interpretation: Analyzed the Completed 204 No Content response. Although it is not an error message, it indicates that the action was executed successfully without returning any content.

Confirmation of Resolution: Based on the response and the absence of a specific error message, it seems that the issue has been resolve