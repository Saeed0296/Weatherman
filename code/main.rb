require 'colorize'
require_relative 'path.rb'
require_relative 'function_of_flag'
require_relative 'read_data'
require_relative 'display'

class WeatherMan
  #mixing
  include Path
  include FunctionalityOfFlag
  include ReadFile
  include PrintData

  #constructor
  def initialize
    @max_temp = [[],[]]
    @min_temp = [[],[]]
    @max_humidity = [[],[]]
    @date ={ '1' => 'Jan', '2' => 'Feb', '3' => 'Mar', '4' => 'Apr','5' => 'May', '6' => 'Jun', '7' => 'Jul', '8' => 'Aug','9' => 'Sep', '01' => 'Jan', '02' => 'Feb', '03' => 'Mar', '04' => 'Apr','05' => 'May', '06' => 'Jun', '07' => 'Jul', '08' => 'Aug','09' => 'Sep', '10' => 'Oct', '11' => 'Nov', '12' => 'Dec' }
  end

  #Check Flag and call related function
  def check_flag_and_decide
    #collect path according to pasing date
    path = collect_path(@date)

    #Check Flag and call related function with collected path
    if ARGV[0] == '-e'
      if flag_e(path)
        display_for_e(@max_temp,@min_temp,@max_humidity)
      else
        puts "\n\n\t!No record found in #{ARGV[1]} "
      end
    elsif ARGV[0] == '-a'
      flag_a(path)
    elsif ARGV[0] == '-c'
      flag_c(path)
    elsif ARGV.empty?
      puts "\n\t!Flag miss\n"
    else
      puts "\n\t!Wrong Flag\n"
    end
  end

  #Check and update class varriable
  def check_update(temp, low, humid)
    if temp[0].max.to_i > @max_temp[0][0].to_i
      @max_temp[0][0] = temp[0].max
      @max_temp[1][0] = temp[1][temp[0].find_index(temp[0].max).to_i]
    end
    if @min_temp[0][0].nil? || low[0].min.to_i < @min_temp[0][0].to_i
      @min_temp[0][0] = low[0].min
      @min_temp[1][0] = low[1][low[0].find_index(low[0].min).to_i]
    end
    if humid[0].max.to_i > @max_humidity[0][0].to_i
      @max_humidity[0][0] = humid[0].max
      @max_humidity[1][0] = humid[1][humid[0].find_index(humid[0].max).to_i]
    end
  end

  #driver function
  def driver_function
    check_flag_and_decide
  end
end

obj = WeatherMan.new
obj.driver_function
