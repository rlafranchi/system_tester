require 'pty'
module SystemTester
  class CommandHandler
    attr_reader :status
    def initialize(cmd)
      @cmd = cmd
      @status = nil
    end

    def run(&block)
      status = pty do |r,w,pid|
        yield r.getc until r.eof?
        Process.wait(pid)
      end
    end

    def run_each_line(&block)
      status = pty do |r,w,pid|
        r.each do |line|
          yield line
        end
        Process.wait(pid)
      end
    end

    private

    def pty(&block)
      PTY.spawn(@cmd, &block)
      @status = $?.exitstatus
    end
  end
end