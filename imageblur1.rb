class Image
  
  def initialize(array)
    @arr = array
    puts @pic.inspect
  end

  def output_image
    @arr.each do |a|
      puts a.join
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
