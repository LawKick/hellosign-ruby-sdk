#
# The MIT License (MIT)
#
# Copyright (C) 2014 hellosign.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

module HelloSign
  module Api

    #
    # Contains all the api calls for the Account resource.
    # Take a look at our {https://www.hellosign.com/api/reference#Account account api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module Account

      #
      # Returns the current user's account information.
      #
      # @return [HelloSign::Resource::Account] current user's account
      #
      # @example
      #   account = @client.get_account
      #
      def get_account
        HelloSign::Resource::Account.new get('/account')
      end

      #
      # Creates a new HelloSign account. The user will still need to confirm their email address
      # to complete the creation process.
      #
      # Note: This request does not require authentication.
      #
      # @option opts [String] email_address New user's email address
      #
      # @return [HelloSign::Resource::Account] New user's account information
      #
      # @example
      #   account = @client.create_account :email_address => 'newuser@example.com'
      #
      def create_account(opts)
        HelloSign::Resource::Account.new post('/account/create', :body => opts)
      end

      #
      # Updates the current user's callback URL
      # @option opts [String] callback_url New user's callback url
      #
      # @return [HelloSign::Resource::Account] Updated user's account information
      #
      # @example
      #   account = @client.update_account :callback_url => 'https://www.example.com/callback'
      #
      def update_account(opts)
        HelloSign::Resource::Account.new post('/account', :body => opts)
      end

      #
      # Check whether an account exists
      # @option opts [String] email_address user email
      #
      # @return [Bool] true if exists, else false
      # @example
      #   account = @client.verify :email_address => 'newuser@example.com'
      #
      def verify(opts)
        post('/account/verify', :body => opts).empty? ? false : true
      end
    end
  end
end
