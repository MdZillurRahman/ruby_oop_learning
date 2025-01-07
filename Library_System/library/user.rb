require 'fileutils'

class Book
  def initialize(books, current_user)
    @books = books
    @current_user = current_user
    FileUtils.mkdir_p('data') # Create data directory if it doesn't exist
  end

  def add(title, author, status)
    book = {
      id: generate_id,
      title: title,
      author: author,
      status: status
    }

    user_index = @users.find_index { |u| u[:id] == @current_user[:id] }
    @users[user_index][:books] << book
    @current_user = @users[user_index]
    save_data('data/users.json', @users)
    "Book added successfully!"
  end

  def view
    if @current_user[:books].empty?
      return "No books in your library!"
    end

    @current_user[:books].map do |book|
      "ID: #{book[:id]}\nTitle: #{book[:title]}\nAuthor: #{book[:author]}\nStatus: #{book[:status]}\n---"
    end.join("\n")
  end

  private

  def generate_id
    rand(10000..99999)
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end
end
