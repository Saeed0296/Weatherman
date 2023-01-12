#module for display desire output
module PrintData

  #display function in case '-e' flag
  def display_for_e(max_temp, min_temp, max_humidity)
    monthsName = { '1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June', '7' => 'July', '8' => 'August', '9' => 'September', '01' => 'January', '02' => 'February', '03' => 'March', '04' => 'April','05' => 'May', '06' => 'June', '07' => 'July', '08' => 'August', '09' => 'September', '10' => 'October', '11' => 'November', '12' => 'December' }

    puts "\n\n==>\tAccording to Available record\n"
    year , month , day = (max_temp[1].to_s).split('-')
    puts "\t\tHighest :#{max_temp[0][0]}C on #{monthsName[month]} #{day.to_i}"
    year , month , day = (min_temp[1].to_s).split('-')
    puts "\t\tLowest  :#{min_temp[0][0]}C on #{monthsName[month]} #{year[-2]}#{year[-1]}"
    year , month , day = (min_temp[1].to_s).split('-')
    puts "\t\tHumid   :#{max_humidity[0][0]}% on #{monthsName[month]} #{year[-2]}#{year[-1]}"
  end

  #display function in case '-a' flag
  def display_for_a(max_t,min_t,max_h)
    max_temp = max_t.map(&:to_i)
    min_temp = min_t.map(&:to_i)
    max_humid = max_h.map(&:to_i)

    puts "\n\n==>\tAccording to Available record\n"
    puts "\t\tHighest Average  : #{max_temp.sum / max_temp.count}C"
    puts "\t\tLowest Average   : #{min_temp.sum / min_temp.count}C"
    puts "\t\tAverage Humidity : #{max_humid.sum / max_humid.count}%"
  end

  #display function in case '-c' flag
  def display_for_c(max_t,min_t)
    puts "\n\n==>\tHorizontal bar chart according to available record\n\n"

    max_t[0].each_with_index do |_element, i|

      print "\t\t"
      print max_t[1][i].split('-')[2].to_s
      print " "
      min_t[0][i].to_i.times { print '+'.blue }
      max_t[0][i].to_i.times { print '+'.red }
      puts " #{min_t[0][i]}C-#{max_t[0][i]}C"
    end
  end
end
