path="/Users/Tatsuya/rails/restaurant"

worker_processes 2
working_directory path

#listen "/var/run/unicorn_restaurant.sock"   # Unix Domain Socket
pid "#{path}/tmp/pids/unicorn.pid"       # PIDファイル出力先
 
timeout 60
 
preload_app true

stdout_path "#{path}/log/unicorn.stdout.log"  # 標準出力ログ出力先
stderr_path "#{path}/log/unicorn.stderr.log"  # 標準エラー出力ログ出力先
 
#GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

=begin 
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
 
    sleep 1
  end
 
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
=end
