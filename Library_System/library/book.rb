require 'fileutils'
require_relative 'utility'

class Book
  include Utility

  def initialize(current_user)
    @current_user = current_user
    @users = load_data('data/users.json', [])
    FileUtils.mkdir_p('data') # Create data directory if it doesn't exist
  end

  def add(title, author, status)
    book = {
      id: generate_id,
      title: title,
      author: author,
      status: status
    }

    user_index = find_current_user_index
    @users[user_index][:books] << book
    update_user_data(user_index)
    "Book added successfully!"
  end

  def view
    if @current_user[:books].empty?
      return "\nNo books in your library!"
    end

    @current_user[:books].map do |book|
      "ID: #{book[:id]}\nTitle: #{book[:title]}\nAuthor: #{book[:author]}\nStatus: #{book[:status]}\n---"
    end.join("\n")
  end

  private :generate_id, :save_data, :load_data, :find_current_user_index, :update_user_data
end
