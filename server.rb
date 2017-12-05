require 'sinatra/base'

require_relative 'helpers/file_helper'

class LineServer < Sinatra::Base
    file_path = FileHelper.valid_path(ARGV)
    LINES_HASH, LINE_COUNT = FileHelper.parse_text_file(file_path)

    get '/lines/:line_index' do
        line_key = params["line_index"].to_i

        if line_key > 0 && line_key <= LINE_COUNT
            LINES_HASH[line_key-1]
        else
            halt(413, "413: payload too large")
        end
    end

end

run LineServer.run!
