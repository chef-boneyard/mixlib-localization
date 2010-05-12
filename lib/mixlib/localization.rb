#
# Author:: Nuo Yan <nuo@opscode.com>
#
# Copyright 2010, Opscode, Inc.
#
# All rights reserved - do not redistribute
#

require 'mixlib/log'

module Mixlib
  module Localization
    
    class Log
      extend  Mixlib::Log      
    end

    Log.level = :error
    
    class MessageRetrievalError < StandardError
    end
    

    
  end
end