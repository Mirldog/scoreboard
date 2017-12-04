class Player

  def initialize
    @name = ''
    @wins = 0
    @losses = 0
    @goals = 0
    @points = 0
  end

  def loaded(wins, losses, goals, points)
    @name = @name
    @wins = wins
    @losses = losses
    @goals = goals
    @points = points
  end

  def set_name(name)
    @name = name.strip
  end

  def add_win
    @wins = @wins +1
  end

  def add_loss
    @losses = @losses +1
  end

  def add_goal
    puts "How many goals scored?"
    @goals = @goals + gets.to_i
  end

  def add_points
    puts "How many points scored?"
    @points = @points + gets.to_i
  end

  def to_s
    return "\nName: #{@name} \nWins: #{@wins} \nLosses: #{@losses} \nGoals: #{@goals} \nPoints: #{@points} \n----------"
  end

  def csv
    return "#{@name},#{@wins},#{@losses},#{@goals},#{@points}"
  end

  def name
    return "#{@name}"
  end

  def get_wins
    return @wins
  end

  def get_losses
    return @losses
  end

  def get_goals
    return @goals
  end

  def get_points
    return @points
  end

  def set_wins(wins)
    @wins = wins
  end

  def set_losses(losses)
    @losses = losses
  end

  def set_goals(goals)
    @goals = goals
  end

  def set_points(points)
    @points = points
  end

  def change?(wins,losses,goals,points)
    if @wins == wins and @losses == losses and @goals == goals and @points == points
      return false
    else
      return true
    end
  end

end