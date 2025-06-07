# AI Study Tracker

**Track your learning. Visualize your progress. Get AI-powered feedback.**  

> 🚀 Built with a custom Ruby web framework

---

## 🧩 Features

| Feature               | Description                                    |
|------------------------|------------------------------------------------|
| ✍️ Track Learning Logs | Add topic, hours, notes for each study session |
| 📊 Visual Stats       | See your time distribution via charts          |
| 🤖 GPT-4 Feedback     | Get weekly personalized feedback                |
| 🖥️ Minimal UI         | Simple, clean layout built with ERB             |

---

## 🗂️ Project Structure

```
ai_study_tracker/
├── app.rb
├── config.ru
├── Gemfile
├── lib/
│   ├── mini_web/          # Custom framework core
│   ├── models/            # ORM Models (User, Entry)
│   ├── controllers/       # Routes for entries, stats, feedback
│   ├── services/          # GPT Feedback Service
│   └── database.rb        # DB setup (SQLite via Sequel)
├── views/
│   ├── layout.erb         # Global HTML template
│   ├── home.erb           # Home page
│   ├── entries/new.erb    # New entry form
│   └── stats/index.html   # Stats page (Chart.js)
├── public/
└── db/
```

---

## ⚙️ Setup Instructions

```bash
# Install dependencies
bundle install

# Run the app
rackup
```

Make sure to set your OpenAI API key:

```bash
export OPENAI_API_KEY=your-key-here
```

---

## 📈 Sample Screenshots

> _You can add real screenshots here if this is going public!_

- 📋 Entry Form  
- 📊 Stats with Charts  
- 🧠 GPT-4 Weekly Feedback

---