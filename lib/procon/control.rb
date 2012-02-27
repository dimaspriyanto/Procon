module Procon
  class Control
    self.config = Struct.new(:pid_file_path, :log_file_path).new

    def initialize(command, options={})
      @command, @options = command, options
      process(@command)
    end

    def process(param)
      command = %w( start stop restart ).include?(param) ? param : 'start'
      send(command)
    end

    private
    def run
      puts "Starting process.."
    end

    def start
      if process_exist?
        raise "Process already running"
      else
        run
      end
    end

    def stop
      kill_current_process!
      exit
    end

    def restart
      kill_current_process!
      run
    end

    def process_exist?
      pid = get_pid
      if pid
        begin
          return true if Process.getpgid(pid)
        rescue Errno::ESRCH
          return false
        end
      else
        return false
      end
    end

    def kill_current_process!
      pid = get_pid
      if pid
        begin
          Process.kill(9, pid)
          puts "Process killed: #{pid}"
        rescue Exception => e
          puts "Failed to kill process: #{e.message}"
          exit
        end
      end
    end

    def get_pid
      pid_file_path = Procon::Control.config.pid_file_path || 'tmp/control.pid'
      File.open(pid_file_path, 'r+') {|f| f.read }.to_i
    rescue
      return false
    end
  end
end

