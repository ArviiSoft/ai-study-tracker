require_relative "../services/feedback_generator"

class FeedbackController
  def index(req, res)
    feedback = FeedbackGenerator.generate(1)
    res.write "<h1>AI Feedback</h1><p>#{feedback}</p>"
  end
end