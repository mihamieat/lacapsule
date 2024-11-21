# API deployment with APP runner
## GitHub Repo
`sh
git@github.com:mihamieat/Ultimate-Timer-API.git`

# Static deployment with Codepipeline
## GitHub Repo
`git@github.com:mihamieat/ultimatetimer-front.git`

# AWS Lambda
this is a quick tutorial to test AWS Lambda with `lambda_handler` function creating `myfirstfunction` app.
## steps
- create a new python function from scratch
- test editing `lambda_handler` function by adding a print (e.g. `print("Hello lambda!")`)
- click `Test` to create a new test event based on `hello world` model event
- run `Test` with created model event
- with ***eventbridge*** create an event that runs `myfirstfunction` every 5 minutes
- check on ***lambda*** the periodic invocations.
- delete
