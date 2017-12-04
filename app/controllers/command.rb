class Command
=begin
Database for players on goal/point system games
Created by Kyle Mirley
=end


#players will be stored in a hash (name, player-object)
  def initialize
    @players = Hash.new
    @num = 0
    @bool = true
    @size = 0
    @player = nil
  end

#gets info for all the players
  def get_players
    puts "What is the size of your party?"
    @size = gets.to_i
    @num = 1
  end

#adds player to hash of players, @bool for looping through starting player count
#otherwise only adds one player
  def add_player
    @size.times do
      puts "What is the name of player #{@num}"
      @num+=1
      name = gets.downcase.strip
      if @players.has_key?(name)
        puts "2 players cannot have the same name"
        @num -=1
        add_player
      end
      player = Player.new
      player.set_name(name)
      @players.store(name,player)
      if @size == 1
        @player = player
      end
    end
  end


  def player_add(name)
    name = name.downcase.strip
    if @players.has_key?(name)
      puts "2 players cannot have the same name"
    else
      player = Player.new
      player.set_name(name)
      @players.store(name,player)
      if @size == 1
        @player = player
      end
    end
  end

#switches commands to run on player that was just added
  def add_switch(name)
    @player = @players.values_at(name)
  end


#shows all players and values
  def standings
    puts @players.values
    wins_leader
    goals_leader
    points_leader
  end



#adds win to players command station
  def add_win(player)
    player.add_win
  end

#adds loss to players command station
  def add_loss(player)
    player.add_loss
  end

#adds goal to players command station
  def add_goal(player)
    player.add_goal
  end

#adds points to players command station
  def add_points(player)
    player.add_points
  end

#shows stats of player
  def show_stats(player)
    puts "#{player}"
  end

#switches command station from one player to another
  def switch_player
    find_player
  end

#shows the current command station open
  def curr
    if @player == nil
      puts "No player selected"
      add_player
    else
      puts "Command station for #{@player.name}"
    end
  end

  def points_leader
    temp = @player
    @players.each_value do |x|
      num = x.get_points
      if num > @points
        @points = num
        @player = x
      end
    end
    if @player.get_points > 1 or @player.get_points == 0
      puts "Leader in points: #{@player.name} at #{@player.get_points} points"
    else
      puts "Leader in points: #{@player.name} at #{@player.get_points} point"
    end
    @player = temp
  end

  def goals_leader
    temp = @player
    @players.each_value do |x|
      num = x.get_goals
      if num > @goals
        @goals = num
        @player = x
      end
    end
    if @player.get_goals > 1 or @player.get_goals == 0
      puts "Leader in goals: #{@player.name} at #{@player.get_goals} goals"
    else
      puts "Leader in goals: #{@player.name} at #{@player.get_goals} goal"
    end
    @player = temp
  end

  def wins_leader
    temp = @player
    @players.each_value do |x|
      num = x.get_wins
      if num > @wins
        @wins = num
        @player = x
      end
    end
    if @player.get_wins > 1 or @player.get_wins == 0
      puts "Leader in wins: #{@player.name} at #{@player.get_wins} wins"
    else
      puts "Leader in wins: #{@player.name} at #{@player.get_wins} win"
    end
    @player = temp
  end

  def find_player
    name= gets.downcase.strip
    if @players.has_key?(name)
      @player = @players[name]
    else
      puts "Player not found"
      puts @players.keys
      find_player
    end
  end

end
