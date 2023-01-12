#module perform functionality against flag
module FunctionalityOfFlag

  def flag_e (path)
    flag = false

    #check if files exist then read it
    path.each do|pa|
      if File.exist?(pa)
        max_t = get_data(pa,1)
        min_t = get_data(pa,3)
        max_humid = get_data(pa, 7)

        #update class variables
        check_update(max_t, min_t, max_humid)

        #File found
        flag = true
      else
        puts "\n#{pa}\n\t!File not found"
      end
    end
    return flag
  end

  def flag_a (path)

    pa = path[0]
    #check if files exist then read it
    if File.exist?(pa)
      max_t = get_data(pa, 1)
      min_t = get_data(pa,3)
      avg_humid = get_data(pa, 8)

      #display average
      display_for_a(max_t[0],min_t[0],avg_humid[0])
    else
      puts "\n#{pa}\n\t!File not found"
    end
  end

  def flag_c (path)
    pa = path[0]
    #check if files exist then read it
    if File.exist?(pa)
      max_t = get_data(pa, 1)
      min_t = get_data(pa,3)

      #display average
      display_for_c(max_t,min_t)
    else
      puts "\n#{pa}\n\t!File not found"
    end
  end



end
