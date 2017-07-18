require 'pty'
module SystemTester
  class CommandHandler
    attr_reader :status
    def initialize(cmd)
      @cmd = cmd
      @status = nil
    end

    def run(&block)
      pty do |r,w,pid|
        rescue_errno pid do
          yield r.getc until r.eof?
        end
      end
    end

    def run_each_line(&block)
      pty do |r,w,pid|
        rescue_errno pid do
          r.each do |line|
            yield line
          end
        end
      end
    end

    private

    def pty(&block)
      PTY.spawn(@cmd, &block)
      @status = $?.exitstatus
    end

    def rescue_errno(pid, &block)
      begin
        yield
      rescue Errno::EIO
      ensure
        Process.wait pid
      end
    end
  end
end