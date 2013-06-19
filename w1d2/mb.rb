require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    @client.update(message)
  end

  def followers_list
    @client.followers.collect{|follower| follower.screen_name}
  end

  def dm(target,message)
    puts "DM #{target} the following: #{message}"
    screen_names = followers_list
    if screen_names.include?(target)
      tweet("d #{target} #{message}")
    else
      puts "You're not following #{target}!"
    end
  end

  def spam_my_friends(message)
    screen_names = followers_list
    followers_list.each do |follower|
      dm(follower,message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends
    sort_friends = friends.sort_by { |friend| friend.screen_name.downcase}
    sort_friends.each do |friend|
      timestamp = friend.status.created_at.strftime("%A, %b %d")
      puts "#{friend.screen_name} said this on #{timestamp}"
      puts "#{friend.status.text}"
    end
  end

  def run
      command = ""
      while command != "q"
        puts ""
        printf "enter command: "
        input = gets.chomp
        parts = input.split
        command = parts[0]
        case command
        when 'last' then everyones_last_tweet()
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'spam' then spam_my_friends(parts[1..-1].join(" "))
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
        else
        puts "Sorry, I don't know how to (#{command})"
        end
      end
    end
end

blogger = MicroBlogger.new
blogger.run