require "sequel"

DB = Sequel.sqlite("db/app.db")

unless DB.table_exists?(:entries)
  DB.create_table :entries do
    primary_key :id
    String :topic
    Integer :hours_spent
    String :notes
    Date :date
    Integer :user_id
  end
end

class Entry < Sequel::Model(:entries); end

unless DB.table_exists?(:users)
  DB.create_table :users do
    primary_key :id
    String :name
    String :email
  end
end

class User < Sequel::Model(:users); end

unless DB.table_exists?(:feedback)
  DB.create_table :feedback do
    primary_key :id
    String :content
    Integer :user_id
  end
end

class Feedback < Sequel::Model(:feedback); end

unless DB.table_exists?(:stats)
  DB.create_table :stats do
    primary_key :id
    Integer :user_id
    Date :date
    Integer :total_hours
  end
end

class Stat < Sequel::Model(:stats); end

DB.loggers << Logger.new($stdout) if ENV['RACK_ENV'] == 'development'
DB.freeze