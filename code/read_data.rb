#read specific colloum data from file
module ReadFile

  def get_data(filePath, col)
    arr = [[], []]

    File.open(filePath, 'r') do |file|

      file.readline
      file.readlines.each do |line|

        data = line.split(',')
        x = data[col]
        arr[0].append(x) if x != '' && arr[1].append(data[0])
      end

      arr
    end
  end
end
