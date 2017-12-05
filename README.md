# Line Server

Simple API that returns contents of specified line from a .txt file

## Getting Started

To build the system run build.sh

To run the server run run.sh <text-file>. Server will only start if a
valid .txt file is added

## How It Works

After starting the server with a valid .txt file, the API can be called with
a GET /lines/<line-index>. (Note: by default, the server will run on port 4567)

If the line index selected is within the length of the .txt file, it will return
the contents of that line. Otherwise, it will return a 413.

## Performance

API PERFORMANCE:
1GB: ~6.0e-06 sec
10GB: ~6.0e-06 sec
100GB: ~6.0e-06 sec

Hash lookup in Ruby is O(1) so lookup time will always be about the same

However, Pre-processing is O(n) And even a 1GB file takes ~528 seconds. Problems
will definitely arise at 10GB and this service likely can't handle a 100GB file

USER LOAD:

With Sinatra and the relatively short turnaround for each request, this service
should be able to handle ~3000 requests per second. The system will work with
100 users or 100000 users. For 1000000 users there needs to be some queuing
implemented

## Documentation used
http://blog.scoutapp.com/articles/2017/02/20/rails-api-vs-sinatra-vs-grape-which-ruby-microframework-is-right-for-you
https://www.engineyard.com/blog/hash-lookup-in-ruby-why-is-it-so-fast
http://sinatrarb.com/documentation.html
https://x-team.com/blog/how-to-create-a-ruby-api-with-sinatra/

## Libraries

Sinatra:
I chose Sinatra because it is a lightweight framework that allowed me to
easily spin up an API server.

I chose this over rails because it is faster for a simple API like this
LineServer app and over Grape because I had worked with Sinatra before.

## TODO
I spent 4 hours creating this service. About 15% of that was researching, 50% of
that was getting the server up and working and 35% testing and documenting. I
did not have time to optimize the pre-processing and it is problematic. Also, I
have not tests so I would consider this service incomplete. The other things I
don't like is that my error handling is inconsistent, and I have a function that
returns 2 values, which is something I would refactor out out. If I had more
time I would prioritize writing a few tests for my file_helper module, then
working on optimizing the pre-processing.
