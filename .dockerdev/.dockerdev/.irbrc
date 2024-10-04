# frozen_string_literal: true

require 'irb/completion'
require 'irb/ext/save-history'
require '/private_methods.rb'

IRB.conf[:HISTORY_FILE] = ENV["IRB_HISTFILE"] if ENV["IRB_HISTFILE"]
IRB.conf[:SAVE_HISTORY] = 5000
IRB.conf[:AUTO_INDENT]  = true

# Thinking of configure this file w/ something like
# https://medium.com/simply-dev/do-more-with-rails-console-by-configuring-irbrc-e5c25284305d

alias q exit

###########################################
#
# You may create in .dockerdev folder file named private_methods.rb to have you own methods.
# Please, don't be shy and share with your teammates, if you got something interesting!
# You may also add some useful methods below to examples.
# I think, if method is useful for everyone, we may add it in .irbrc so it will be default.
# Maybe method for easy benchmarking? or smth like that
#
###########################################
###### .dockerdev/private_methods.rb ######
#
# def dpc
#   @_dpc ||= LoyaltySystem::DropsPromoCampaign.take
# end
#
# def me
#   @_me ||= AdminUser.find(1)
# end
#
# alias admin me
