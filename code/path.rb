#module for get path of all files
module Path
  def collect_path(date)

    #check date
    if ARGV[1].nil?
        puts "\n\t!Date miss"
    else

      #check path
      if ARGV[2].nil?
        puts "\n\t!path miss"
      else

        #save path
        year , month = ARGV[1].split('/')
        path = []

        path_list = ARGV[2].split('/')

        if not month.nil?
          path.append("#{ARGV[2]}/#{path_list[-1]}_#{year}_#{date[month]}.txt")
        else
          12.times {|i| path.append("#{ARGV[2]}/#{path_list[-1]}_#{year}_#{date[(i+1).to_s]}.txt")}
        end
        return path
      end
    end
  end
end
