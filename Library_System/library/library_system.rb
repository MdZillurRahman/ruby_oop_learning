require_relative 'auth'
require_relative 'book'
require 'json'

class LibrarySystem
  include Utility

  def initialize
    @users = load_data('data/users.json', [])
    @current_user = nil
    @auth = Auth.new(@users)
    @book_manager = Book.new(@current_user)
  end

  def start
    loop do
      if @current_user
        show_user_menu
      else
        show_auth_menu
      end
    end
  end

  private :generate_id, :save_data, :load_data, :find_current_user_index, :update_user_data

  def show_auth_menu
    puts "\n=== Library Management System ==="
    puts "1. Login"
    puts "2. Register"
    puts "3. Exit"
    print "Choose an option: "
    
    case gets.chomp
    when "1" then login
    when "2" then register
    when "3" then exit
    else
      puts "Invalid option!"
    end
  end

  def show_user_menu
    puts "\n=== Welcome #{@current_user[:username]} ==="
    puts "1. View My Books"
    puts "2. Add Book"
    puts "3. Edit Book"
    puts "4. Delete Book"
    puts "5. View Wishlist"
    puts "6. Add to Wishlist"
    puts "7. Logout"
    print "Choose an option: "
    
    case gets.chomp
    when "1" then view_books
    when "2" then add_book
    when "3" then edit_book
    when "4" then delete_book
    when "5" then view_wishlist
    when "6" then add_to_wishlist
    when "7" then logout
    else
      puts "Invalid option!"
    end
  end

  def login
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp

    user = @auth.login(username, password)
    if user
      @current_user = user
      @book_manager = Book.new(@current_user)
      puts "Login successful!"
    else
      puts "Invalid credentials!"
    end
  end

  def register
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp

    message = @auth.register(username, password)
    puts message
  end

  def logout
    @current_user = nil
    puts "Logged out successfully!"
  end

  def view_books
    puts @book_manager.view
  end

  def add_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    print "Status (read/reading/to-read): "
    status = gets.chomp

    puts @book_manager.add(title, author, status)
  end

  def edit_book
    view_books
    print "Enter book ID to edit: "
    book_id = gets.chomp.to_i

    user_index = find_current_user_index
    book_index = @users[user_index][:books].find_index { |b| b[:id] == book_id }

    if book_index
      print "New title (or press enter to skip): "
      title = gets.chomp
      print "New author (or press enter to skip): "
      author = gets.chomp
      print "New status (or press enter to skip): "
      status = gets.chomp

      book = @users[user_index][:books][book_index]
      book[:title] = title unless title.empty?
      book[:author] = author unless author.empty?
      book[:status] = status unless status.empty?

      update_user_data(user_index)
      puts "Book updated successfully!"
    else
      puts "Book not found!"
    end
  end

  def delete_book
    view_books
    print "Enter book ID to delete: "
    book_id = gets.chomp.to_i

    user_index = find_current_user_index
    initial_count = @users[user_index][:books].length
    @users[user_index][:books].delete_if { |b| b[:id] == book_id }

    if @users[user_index][:books].length < initial_count
      update_user_data(user_index)
      puts "Book deleted successfully!"
    else
      puts "Book not found!"
    end
  end

  def view_wishlist
    if @current_user[:wishlist].empty?
      puts "Your wishlist is empty!"
      return
    end

    puts "\nYour Wishlist:"
    @current_user[:wishlist].each do |book|
      puts "ID: #{book[:id]}"
      puts "Title: #{book[:title]}"
      puts "Author: #{book[:author]}"
      puts "---"
    end
  end

  def add_to_wishlist
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp

    book = {
      id: generate_id,
      title: title,
      author: author
    }

    user_index = find_current_user_index
    @users[user_index][:wishlist] << book
    update_user_data(user_index)
    puts "Book added to wishlist successfully!"
  end
end

# Start the application
LibrarySystem.new.start
