require "openai"

class FeedbackGenerator
  def self.generate(user_id)
    entries = Entry.where(user_id: user_id).where(date: (Date.today - 7)..Date.today).all
    return "No records found in the last 7 days." if entries.empty?

    summary = entries.map { |e| "- #{e.date}: #{e.topic}, #{e.hours_spent} hours" }.join("\n")

    prompt = <<~PROMPT
      Based on the following weekly study log, write a brief feedback.
      Which topics received too much or too little time? Is the balance good?:
      #{summary}
    PROMPT

    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

    response = client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are an experienced study coach." },
          { role: "user", content: prompt }
        ]
      }
    )

    feedback = response.dig("choices", 0, "message", "content")
    feedback || "Feedback could not be retrieved."
  end
end