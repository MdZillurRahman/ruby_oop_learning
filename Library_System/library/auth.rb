require 'bcrypt'
require 'json'
require 'fileutils'

class Auth
  def initialize(users)
    @users = users
    FileUtils.mkdir_p('data') # Create data directory if it doesn't exist
  end

  def register(username, password)
    if @users.any? { |u| u[:username] == username }
      return "Username already exists!"
    end

    user = {
      id: generate_id,
      username: username,
      password: BCrypt::Password.create(password),
      books: [],
      wishlist: []
    }

    @users << user
    save_data('data/users.json', @users)
    "Registration successful!"
  end

  def login(username, password)
    user = @users.find { |u| u[:username] == username }
    if user && BCrypt::Password.new(user[:password]) == password
      user
      "Successfully logged in!!"
    else
      nil
    end
  end

  private

  def generate_id
    rand(10000..99999)
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end
end

# Load users from file or initialize an empty array
# For test purpose
# users_file = 'data/users.json'
# if File.exist?(users_file)
#   users = JSON.parse(File.read(users_file), symbolize_names: true)
# else
#   users = []
# end

# Prompt user for registration details
# puts "Username: "
# username = gets.chomp

# puts "Password: "
# password = gets.chomp

# auth = Auth.new(users)
# puts auth.register(username, password)
# puts auth.login(username, password)
