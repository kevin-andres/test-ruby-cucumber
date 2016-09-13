##
# This Class provides helper and support methods required in other classes.
# Methods like logging, configuration, test data management will be available
# through this class
#
# Author::     Ramandeep <ramandeepsingh@qainfotech.com>
##

require 'logger'

# Initialize global logger variable
module CogBurn
  class Helper
    attr_accessor :log

    def initialize config
      @log = get_logger config.logger.type, config.logger.log_file, config.logger.level
    end # def initialize

    # current epoch timestamp
    def timestamp
      Time.now.to_i.to_s
    end

    # substitute timestamp in data params
    def fill_timestamp data, timestamp=timestamp
      data.gsub '[TIMESTAMP]', timestamp
    end

    # returns a logger
    def get_logger type, file, level
      if type.downcase == "console"
        return console_logger level
      elsif type.downcase == "file"
        return file_logger file, level
      else
        raise "Incorrect Logger type. Must be 'console' or 'file'"
      end
    end # get_logger...

    # returns a console logger
    def console_logger level='INFO'
      log = Logger.new(STDOUT)
      case level.upcase
      when "DEBUG"
        log.level = Logger::DEBUG
      when "INFO"
        log.level = Logger::INFO
      when "WARN"
        log.level = Logger::WARN
      when "ERROR"
        log.level = Logger::ERROR
      else
       log.level = Logger::INFO
      end
      log
    end # console_logger...

    # returns a file logger
    def file_logger file, level='DEBUG'
      log = Logger.new(file, 2, 10240000)
      case level.upcase
      when "DEBUG"
        log.level = Logger::DEBUG
      when "INFO"
        log.level = Logger::INFO
      when "WARN"
        log.level = Logger::WARN
      when "ERROR"
        log.level = Logger::ERROR
      else
        log.level = Logger::INFO
      end
      log
    end # def file_logger...

  end # class Helper
end # module CogBurn