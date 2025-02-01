## Project Conversation History with User Authentication

This Rails application allows users to leave comments and change the status of a project. The project conversation history lists comments and status changes.

### Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/mansoor1234/project-conversation-history.git
   cd project-conversation-history
```

2. **Install Dependencies:**

  ```bash
   bundle install
```
3. **Set Up the Database:**

  ```bash
   rails db:create
   rails db:migrate
   rails db:seed
```
The ``` rails db:seed``` command will create a user with the following credentials:
- Email: test@example.com
- Password: password

Alternatively, you can create a user by clicking on the "Sign Up" button in the application and following the registration process.

**Questions and Answers**

**1. Should users authenticate before leaving comments or changing project status?**
- Answer:  "Pending", "In Progress", "Completed".

**2. Should comments be editable or deletable?**
- Answer:  No, comments should be permanent.

**3. What statuses can a project have?**
- Answer:  "Pending", "In Progress", "Completed".

**4. Should status changes also be recorded in conversation history?**
- Answer:  "Pending", "In Progress", "Completed".

**3. Do we need an API, or just a web UI?**
- Answer: A web UI is enough for now..