class Printer
  def self.info msg
    print " [ \033[00;34m..\033[0m ] " + msg
  end
  
  def self.user msg
    print "\r [ \033[0;33m?\033[0m ] " + msg + " "
  end
  
  def self.success msg
    puts "\r\033[2K [ \033[00;32mOK\033[0m ] " + msg + "\n"
  end
  
  def self.fail msg
    puts "\r\033[2K [\033[0;31mFAIL\033[0m] " + msg + "\n"
    exit
  end
end
