module FileHelper

    def self.parse_text_file(file_path)
        @lines = {}
        line_count = 0
        begin
            File.open(file_path, 'r').each_line do |line|
                @lines[line_count] = line.chomp
                line_count += 1
            end
        rescue StandardError => error
            raise error
        end
        return @lines, line_count
    end

    def self.valid_path(args)
        if args[0] && File.extname(args[0]) == ".txt"
            valid_path = args[0]
        else
            raise "Error: Missing/Invalid file type"
        end
        valid_path
    end

end
