require "erb"
require_relative "../models/entry"

class EntriesController
  def new(req, res)
    res.write ERB.new(File.read("views/entries/new.erb")).result
  end

  def create(req, res)
    Entry.create(
      topic: req.params["topic"],
      hours_spent: req.params["hours_spent"].to_i,
      notes: req.params["notes"],
      date: Date.today,
      user_id: 1
    )
    res.write "<p style='color:green;'>Record added successfully!</p><a href='/'>Return to homepage</a>"
  end
end