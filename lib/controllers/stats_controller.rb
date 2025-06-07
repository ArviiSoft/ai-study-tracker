require "json"

class StatsController
  def weekly_hours(req, res)
    data = Entry.
      where(date: (Date.today - 6)..Date.today).
      group_and_count(:date).
      select { [date, sum(:hours_spent).as(:hours)] }

    res["Content-Type"] = "application/json"
    res.write data.all.to_json
  end

  def topic_distribution(req, res)
    data = Entry.
      group_and_count(:topic).
      select { [topic, sum(:hours_spent).as(:total)] }

    res["Content-Type"] = "application/json"
    res.write data.all.to_json
  end
end