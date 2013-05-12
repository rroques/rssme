require 'resque/tasks'
 require 'resque_scheduler/tasks'

 task "resque:setup" => :environment do
   # Place One time Job Over Here
   # Example
   # Resque.enqueue_in(10.seconds, OrderCharge, :user_id => 1)
   QUEUE='*'
 end
