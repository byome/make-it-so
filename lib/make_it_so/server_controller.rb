require 'io'

module MakeItSo
  module ServerController
    def self.start_server
      IO.popen("./rustserver start")
    end

    def self.stop_server
      IO.popen("./rustserver stop")
    end

    def self.cold_start(time = 10)
      IO.popen("./rustserver start && sleep #{time} && ./rustserver stop")
    end

    def self.restart_server
      IO.popen("./rustserver restart")
    end
  end
end
