class List
  class Cell
    attr_accessor :data, :link

    def initialize(data, link = nil)
      @data = data
      @link = link
    end
  end

  def initialize(*args)
    @top = Cell.new(nil)
    args.each do |x|
      self << x
    end
  end

  def << (data)
    cp = @top
    while cp.link
      cp = cp.link
    end
    cp.link = Cell.new(data)
  end

  def insert!(position, data)
    i = -1
    cp = @top
    if position < 0
      @top.link = Cell.new(data, @top.link)
      return
    end

    while cp.link
      break if position == i + 1
      cp = cp.link
      i += 1
    end
    cp.link = Cell.new(data, cp.link)
  end

  def show
    cp = @top.link
    while cp
      puts cp.data
      cp = cp.link
    end
  end
end

list = List.new(1,2,3)
list << 5
list.show
