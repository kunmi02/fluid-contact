# Fluid contact projects

> This project is about contacts creation and updates with user authentication and authorization on the contacts path.

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.4.4

## Live Demo

[BASE_URL] https://blooming-springs-72487.herokuapp.com/api/

# End points 
API routes for users to create accounts and login to the application
- POST: /user/signup
Username, Password & Email Address
- POST: /api/user/signin
Username & Password
An API route that allow users create contact:
- POST: /api/contact
An API route that allow a logged in user read all contacts created by them:
- GET: /api/contact
An API route that allow a logged in user read a single contact detail created by them:
- GET: /api/contact/<contact id>
An API route that allows a logged in user edit a single contact detail:
- PATCH: /api/contact/<contact id>
An API route that allows a logged in user delete a single contact detail:
- DELETE: /api/contact/<contact id>
An API route that allows a logged in user star a single contact:
- PATCH: /api/contact/<contact id>/star

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

### Deployment

TBA

## Authors

TBA

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

TBA

## 📝 License

TBA
