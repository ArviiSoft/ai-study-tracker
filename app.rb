require_relative "lib/mini_web"
require_relative "lib/controllers/entries_controller"
require_relative "lib/controllers/stats_controller"
require_relative "lib/controllers/feedback_controller"
require_relative "lib/database"

app = MiniWeb::App.new

entries = EntriesController.new
stats = StatsController.new
feedback = FeedbackController.new

app.get("/") { |req, res| res.write(ERB.new(File.read("views/home.erb")).result) }
app.get("/entries/new") { |req, res| entries.new(req, res) }
app.post("/entries") { |req, res| entries.create(req, res) }
app.get("/stats") { |req, res| res.write(File.read("views/stats/index.html")) }
app.get("/stats/weekly_hours") { |req, res| stats.weekly_hours(req, res) }
app.get("/stats/topic_distribution") { |req, res| stats.topic_distribution(req, res) }
app.get("/feedback") { |req, res| feedback.index(req, res) }

run app