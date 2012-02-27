require "procon/version"
require "procon/control"

module Procon
  def self.config
    @config ||= Struct.new(:pid_file_path, :log_file_path, :log_interval, :process_name).new
  end

  def self.run(command="", &block)
    Procon::Control.new(command).process
    pid = fork do
      block.call
    end
    File.open(Procon.config.pid_file_path, 'w') {|f| f.write(pid) }
    Process.detach(pid)
    puts "Running in background PID: #{pid}"
  end
end
