module NameService
  def change_name(name)
    if name == 'うんこ'
      puts "不適切名前です"
      exit
    end
    @name = name
  end

  def get_name
    @name
  end

end
