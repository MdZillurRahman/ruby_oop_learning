require 'json'

module Utility
  def generate_id
    rand(10000..99999)
  end

  def find_current_user_index
    @users.find_index { |u| u[:id] == @current_user[:id] }
  end

  def update_user_data(user_index)
    save_data('data/users.json', @users)
    @current_user = @users[user_index]
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end

  def load_data(filename, default)
    File.exist?(filename) ? JSON.parse(File.read(filename), symbolize_names: true) : default
  end
end
